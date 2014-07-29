package it3191.companion.servlet;

import it3191.companion.dao.Log;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Collections;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import com.google.gson.Gson;

/**
 * Servlet implementation class AuditLogView
 */
@WebServlet("/LogView")
public class LogView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogView() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Sample Log:
		// INFO 2014-07-24 09:43:16,012 UserLogin: Client with email "whitekoffee@gmail.com" and Facebook ID 761632213867348 login successfully.
		
		try {
			List<Log> logs = new ArrayList<Log>();
			List<Map<String, Object>> heatMapInfoDataList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> heatMapWarnDataList = new ArrayList<Map<String, Object>>();
			List<Map<String, Object>> heatMapErrorDataList = new ArrayList<Map<String, Object>>();
			
			Map<String, Integer> heatMapCount = new HashMap<String, Integer>();
			
			DateFormat dateFormatLog = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss,SSS");

			BufferedReader bufferedReader = new BufferedReader(new FileReader(System.getProperty("user.dir") + "/.IT3191-2014S1-Grp2-Azure/app.log"));
			String line;

			while ((line = bufferedReader.readLine()) != null) {				
				String[] lineSegment = line.split(": ");
				String[] metaSegment = lineSegment[0].split(" ");

				Log log = new Log();
				log.setLevel(metaSegment[0]);
				log.setDateLogged(dateFormatLog.parse(metaSegment[1] + " " + metaSegment[2]));
				log.setAction(metaSegment[3]);
				log.setMessage(lineSegment[1]);

				logs.add(log);
				
				// Convert to Calendar for flexibility (removing time factors)
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(log.getDateLogged());
				calendar.set(Calendar.HOUR_OF_DAY, 0);  
				calendar.set(Calendar.MINUTE, 0);  
				calendar.set(Calendar.SECOND, 0);  
				calendar.set(Calendar.MILLISECOND, 0);
				
				// Intermediate count map
				// Calculate day:count heatmap using dictionary keys
				String key = log.getLevel() + " " + calendar.getTime().getTime();
				
				if(heatMapCount.containsKey(key)){
					heatMapCount.put(key,heatMapCount.get(key)+1);
				}else{
					heatMapCount.put(key,1);
				}
				
			}
			
			// Prepare formatting for json
			for(Map.Entry<String, Integer> entry : heatMapCount.entrySet()){				
				Calendar dateLogged = Calendar.getInstance();
				dateLogged.setTimeInMillis(Long.parseLong(entry.getKey().split(" ")[1]));
				
				String level = entry.getKey().split(" ")[0];
				
				int x = dateLogged.get(Calendar.DATE);
				
				// Remove date value before moving on...
				dateLogged.set(Calendar.DATE,1);
				
				long y = dateLogged.getTimeInMillis();
				int z = entry.getValue();
				
				switch(level){
					case "INFO":
						Map<String, Object> heatMapInfoData = new HashMap<String, Object>();
						heatMapInfoData.put("x", x);
						heatMapInfoData.put("y", y);
						heatMapInfoData.put("z", z);
						
						heatMapInfoDataList.add(heatMapInfoData);
						break;
					case "WARN":
						Map<String, Object> heatMapWarnData = new HashMap<String, Object>();
						heatMapWarnData.put("x", x);
						heatMapWarnData.put("y", y);
						heatMapWarnData.put("z", z);
						
						heatMapWarnDataList.add(heatMapWarnData);
						break;
					case "ERROR":
						Map<String, Object> heatMapErrorData = new HashMap<String, Object>();
						heatMapErrorData.put("x", x);
						heatMapErrorData.put("y", y);
						heatMapErrorData.put("z", z);
						
						heatMapErrorDataList.add(heatMapErrorData);
						break;
					default:
						break;
				}
				
			}

			bufferedReader.close();
			
			Gson gson = new Gson();
			String json = "";
			
			switch(request.getParameter("type")){
				case "log":
					// Reverse entries to sort by latest on top
					Collections.reverse(logs);	

					json = gson.toJson(logs);
					break;
				case "heatMap":
					json = gson.toJson(new Object[]{heatMapInfoDataList, heatMapWarnDataList, heatMapErrorDataList});
					break;
				default:
					break;
			}

			response.getWriter().println(json);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

}

package it3191.companion.util;

import it3191.companion.dao.UserDao;
import it3191.companion.dto.Role;
import it3191.companion.dto.User;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class CreateDefaultAdminListener
 *
 */
@WebListener
public class CreateDefaultAdminListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public CreateDefaultAdminListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0) {
        UserDao dao = new UserDao();
        User user = dao.getByEmail("companionadmin@mailinator.com");
        
        if(user == null){
        	try{
	        	User admin = new User();
	        	admin.setFirstName("John");
	        	admin.setLastName("Smith");
	        	admin.setEmail("companionadmin@mailinator.com");
	        	admin.setHandphoneNo("91234567");
	        	admin.setRole(Role.ADMIN);
	        	
	        	byte[] salt = Hash.getNextSalt();
	        	byte[] bDigest = Hash.getHash("root", salt);
	        	String sDigest = Hash.byteToBase64(bDigest);
	        	String sSalt = Hash.byteToBase64(salt);
	        	
	        	admin.setPasswordSHA1(sDigest);
	        	admin.setSalt(sSalt);
	        	admin.setSecurityQuestion(1);
	        	admin.setAnswer("john");
	        	admin.setVerified(true);
	        	
	        	dao.saveOrUpdate(admin);
        	}
        	catch(Exception e){
        		e.printStackTrace();
        	}
        }
        else{
        	//nothing for now
        }
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    }
	
}

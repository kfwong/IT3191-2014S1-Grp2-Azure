package it3191.companion.filter;

import java.io.CharArrayWriter;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

//this class acts as a buffer to tank the response from a servlet, before passing it to the HtmlCompressor for compression
public class ServletResponseWrapper extends HttpServletResponseWrapper {
	private final CharArrayWriter output;

	@Override
	public String toString() {
		return output.toString();
	}

	public ServletResponseWrapper(HttpServletResponse response) {
		super(response);
		output = new CharArrayWriter();
	}

	@Override
	public PrintWriter getWriter() {
		return new PrintWriter(output);
	}
}

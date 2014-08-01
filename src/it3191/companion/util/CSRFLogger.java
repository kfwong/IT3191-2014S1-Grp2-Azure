package it3191.companion.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it3191.companion.servlet.UserLogin;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.owasp.csrfguard.CsrfGuard;
import org.owasp.csrfguard.CsrfGuardException;
import org.owasp.csrfguard.action.AbstractAction;
import org.owasp.csrfguard.log.ILogger;
import org.owasp.csrfguard.log.LogLevel;

public class CSRFLogger implements ILogger{

	private static final long serialVersionUID = 1L;
	private static final Logger log = LogManager.getLogger(org.owasp.csrfguard.CsrfGuard.class.getName());
	
	@Override
	public void log(String arg0) {
		log.error(arg0);
	}

	@Override
	public void log(Exception arg0) {
		log.error(arg0);

	}

	@Override
	public void log(LogLevel arg0, String arg1) {
		log.error(arg1);

	}

	@Override
	public void log(LogLevel arg0, Exception arg1) {
		log.error(arg1);

	}

}

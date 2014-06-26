package it3191.companion.config;

import javax.servlet.ServletContext;

import org.ocpsoft.rewrite.annotation.RewriteConfiguration;
import org.ocpsoft.rewrite.config.Configuration;
import org.ocpsoft.rewrite.config.ConfigurationBuilder;
import org.ocpsoft.rewrite.servlet.config.Forward;
import org.ocpsoft.rewrite.servlet.config.HttpConfigurationProvider;
import org.ocpsoft.rewrite.servlet.config.Path;
import org.ocpsoft.rewrite.servlet.config.Redirect;
import org.ocpsoft.rewrite.servlet.config.rule.Join;

@RewriteConfiguration
public class UrlConfigurationProvider extends HttpConfigurationProvider{

	@Override
	public Configuration getConfiguration(ServletContext arg0) {
		ConfigurationBuilder configurationBuilder = ConfigurationBuilder.begin();
		
		configurationBuilder.addRule(Join.path("/register").to("/register.jsp").withInboundCorrection());
		configurationBuilder.addRule(Join.path("/login").to("/login.jsp").withInboundCorrection());
		configurationBuilder.addRule(Join.path("/404").to("/404.html").withInboundCorrection());
		configurationBuilder.addRule(Join.path("/500").to("/500.html").withInboundCorrection());
		
		return configurationBuilder;
	}

	@Override
	public int priority() {
		return 1;
	}

}

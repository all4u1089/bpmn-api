package com.qlxdcb;

import java.text.ParseException;
import java.util.Arrays;
import java.util.Locale;
import java.util.concurrent.ExecutionException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.servlet.MultipartConfigElement;

import org.camunda.bpm.engine.TaskService;
import org.pac4j.cas.client.CasClient;
import org.pac4j.cas.config.CasConfiguration;
import org.pac4j.cas.config.CasProtocol;
import org.pac4j.core.authorization.authorizer.RequireAnyRoleAuthorizer;
import org.pac4j.core.client.Clients;
import org.pac4j.core.config.Config;
import org.pac4j.http.client.direct.HeaderClient;
import org.pac4j.http.client.direct.ParameterClient;
import org.pac4j.jwt.config.encryption.SecretEncryptionConfiguration;
import org.pac4j.jwt.config.signature.SecretSignatureConfiguration;
import org.pac4j.jwt.config.signature.SignatureConfiguration;
import org.pac4j.jwt.credentials.authenticator.JwtAuthenticator;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.data.elasticsearch.ElasticsearchAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.qlxdcb.clouvir.CasProperties;
import com.qlxdcb.clouvir.CustomAuthorizer;
import com.qlxdcb.clouvir.service.InvalidTokenService;
import com.qlxdcb.clouvir.util.upload.StorageProperties;

import vn.greenglobal.core.model.common.BaseRepositoryImpl;

@SpringBootApplication
@EnableJpaRepositories(repositoryBaseClass = BaseRepositoryImpl.class)
@EnableAutoConfiguration(exclude = { ElasticsearchAutoConfiguration.class })
@EnableConfigurationProperties(StorageProperties.class)
@Controller
@EnableScheduling
@ComponentScan(basePackages = { "vn.greenglobal.core.model.common", "com.qlxdcb.clouvir.controller",
		"com.qlxdcb.clouvir.service", "com.qlxdcb.clouvir" })
public class Application extends SpringBootServletInitializer {

	public static Application app;
	
	@Autowired
	private EntityManager entityManager;
		
	@Autowired
	private TaskService taskService;

	public EntityManager getEntityManager() {
		return entityManager;
	}
	
	public TaskService getTaskService() {
		return taskService;
	}

	public Application() {
		app = this;
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(Application.class);
	}

	public static void main(String[] args) throws BeansException, InterruptedException, ExecutionException {
//		System.setProperty("user.timezone", "GMT+7");
		SpringApplication.run(Application.class, args);
	}

	//@Bean
	public CommandLineRunner commandLineRunner(ApplicationContext ctx) {
		return args -> {
			System.out.println("Let's inspect the beans provided by Spring Boot:");
			String[] beanNames = ctx.getBeanDefinitionNames();
			Arrays.sort(beanNames);
			for (String beanName : beanNames) {
				System.out.println(beanName);
			}
			System.out.println(":::::" + beanNames.length + " beans");
		};
	}

	@Value("${cors.allowedOrigins}")
	private String[] myAllowedOriginList;
	
	@Bean
	public WebMvcConfigurer corsConfigurer() {
		return new WebMvcConfigurerAdapter() {
			@Override
			public void addCorsMappings(CorsRegistry registry) {
				registry.addMapping("/**")
						.allowedOrigins("*")
						.allowCredentials(true)
						.allowedMethods("POST", "PATCH", "GET", "PUT", "OPTIONS", "DELETE", "HEAD")
						.allowedHeaders("Origin", "X-Requested-With", "Content-Type", "Accept", "Content-Length",
								"email", "password", "authorization", "client-security-token",
								"X-Application-Context", "Date", "Content-Disposition")
						.maxAge(3600);
			}
		};
	}

	@Bean
	public Config configPac4j() throws ParseException {
		final SignatureConfiguration secretSignatureConfiguration = new SecretSignatureConfiguration(salt);
		final SecretEncryptionConfiguration secretEncryptionConfiguration = new SecretEncryptionConfiguration(salt);
		final JwtAuthenticator authenticator = new JwtAuthenticator();
		authenticator.setSignatureConfiguration(secretSignatureConfiguration);
		authenticator.setEncryptionConfiguration(secretEncryptionConfiguration);
		HeaderClient headerClient = new HeaderClient(HEADER_STRING, TOKEN_PREFIX + " ", authenticator);
		ParameterClient parameterClient = new ParameterClient("token", authenticator);
		parameterClient.setSupportGetRequest(true);
		
		CasConfiguration casConfiguration = new CasConfiguration(casProperties.getCasServerLoginUrl(), CasProtocol.CAS20);
		casConfiguration.setPrefixUrl(casProperties.getCasServerUrl());
		CasClient casClient = new CasClient(casConfiguration);
		
		final Clients clients = new Clients(casProperties.getAppCallbackUrl(), parameterClient, headerClient, casClient);
		final Config config = new Config(clients);
		config.addAuthorizer("admin", new RequireAnyRoleAuthorizer<>("ROLE_ADMIN"));
		config.addAuthorizer("custom", new CustomAuthorizer());
		return config;
	}

	@Bean
	public LocaleResolver localeResolver() {
		SessionLocaleResolver slr = new SessionLocaleResolver();
		slr.setDefaultLocale(Locale.US);
		return slr;
	}

	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("classpath:locale/messages");
		messageSource.setCacheSeconds(3600); // refresh cache once per hour
		return messageSource;
	}

	@Bean
	public MultipartConfigElement multipartConfigElement() {
		MultipartConfigFactory factory = new MultipartConfigFactory();
		factory.setMaxFileSize(maxFileSize);
		factory.setMaxRequestSize(maxRequestSize);
		return factory.createMultipartConfig();
	}

    
	static final long EXPIRATIONTIME = 864_000_000; // 10 days
	static final String TOKEN_PREFIX = "Bearer";
	static final String HEADER_STRING = "Authorization";
	
	@Value("${airbrake.active:false}")
	public boolean airBrakeActive;
	
	@Value("${salt}")
	private String salt;

	@Value("${spring.http.multipart.max-file-size:54000KB}")
	private String maxFileSize;

	@Value("${spring.http.multipart.max-request-size:54000KB}")
	private String maxRequestSize;

	@Value("${action.view:view}")
	public String VIEW = "";
	@Value("${action.list:list}")
	public String LIST = "";
	@Value("${action.update:update}")
	public String UPDATE = "";
	@Value("${action.delete:delete}")
	public String DELETE = "";
	@Value("${action.add:add}")
	public String ADD = "";

	@Value("${resource.user:user}")
	public String USER = "";
	@Value("${resource.role:role}")
	public String ROLE = "";

	public char SEPARATE_CHAR = ':';
	public String SEPARATE = SEPARATE_CHAR + "";

	@Value("${resource.role}" + ":" + "${action.view}")
	public String ROLE_VIEW;
	@Value("${resource.role}" + ":" + "${action.add}")
	public String ROLE_ADD = "";
	@Value("${resource.role}" + ":" + "${action.list}")
	public String ROLE_LIST = "";
	@Value("${resource.role}" + ":" + "${action.delete}")
	public String ROLE_DELETE = "";
	@Value("${resource.role}" + ":" + "${action.update}")
	public String ROLE_UPDATE = "";

	@Value("${resource.user}" + ":" + "${action.view}")
	public String USER_VIEW = "";
	@Value("${resource.user}" + ":" + "${action.add}")
	public String USER_ADD = "";
	@Value("${resource.user}" + ":" + "${action.list}")
	public String USER_LIST = "";
	@Value("${resource.user}" + ":" + "${action.delete}")
	public String USER_DELETE = "";
	@Value("${resource.user}" + ":" + "${action.update}")
	public String USER_UPDATE = "";

	public String[] getRESOURCES() {
		return new String[] { USER, ROLE };
	}

	public String[] getACTIONS() {
		return new String[] { LIST, VIEW, ADD, UPDATE, DELETE };
	}
	
	@Autowired
	private CasProperties casProperties;
	
	@Autowired
    private EntityManagerFactory entityManagerFactory;
		
	public EntityManagerFactory em() {
		return entityManagerFactory;
	}	
	
	@Autowired
	private InvalidTokenService invalidTokenService;
	
	public InvalidTokenService getInvalidTokenService() {
		return invalidTokenService;
	}
}
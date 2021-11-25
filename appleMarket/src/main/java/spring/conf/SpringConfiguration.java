package spring.conf;



import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:spring/db.properties")
public class SpringConfiguration {
	

	 @Autowired
	 private ApplicationContext applicationContext;
	
	@Value("${jdbc.driver}")
    private String driver;
	@Value("${jdbc.url}")
    private String url;
    @Value("${jdbc.username}")
    private String username;
    @Value("${jdbc.password}")
    private String password;
    
  //connection pool

  	public BasicDataSource dataSource(){
  		BasicDataSource basicDataSource = new BasicDataSource();
  		
  		basicDataSource.setDriverClassName(driver);
  		basicDataSource.setUrl(url);
  		basicDataSource.setUsername(username);
  		basicDataSource.setPassword(password);
  		basicDataSource.setMaxTotal(20);
  		basicDataSource.setMaxIdle(3);
  		
  		return basicDataSource;
  	}
  	
  	
  	 @Bean
     public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("spring/mybatis-config.xml"));
        sqlSessionFactoryBean.setDataSource(dataSource());
        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:*/dao/*Mapper.xml"));
        return sqlSessionFactoryBean.getObject();
     
     }

  	@Bean
  	public SqlSessionTemplate sqlSession() throws Exception {
  		return new SqlSessionTemplate(sqlSessionFactory());
  	}
  	
  	@Bean
  	public DataSourceTransactionManager transactionManager() {
  		DataSourceTransactionManager dataSourceTransactionManager =
  										new DataSourceTransactionManager(dataSource());
  		return dataSourceTransactionManager;
  	}
//---------------------------------------------------------------------------------------------------

}

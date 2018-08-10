package com.eazymation.clouvir;

import java.lang.management.ManagementFactory;

import javax.management.MBeanServer;

import org.springframework.cache.ehcache.EhCacheCacheManager;
import net.sf.ehcache.management.ManagementService;

//@Configuration
public class EhCacheMonitoring {

	//@Autowired
    private EhCacheCacheManager ehCacheCacheManager;
	
    //@Bean
    public MBeanServer mBeanServer() {
        MBeanServer mBeanServer = ManagementFactory.getPlatformMBeanServer();
        return mBeanServer;
    }
    //@Bean
    public ManagementService managementService() {
        ManagementService managementService = new ManagementService(ehCacheCacheManager.getCacheManager(), mBeanServer(), true, true, true, true);
        managementService.init();
        return managementService;
    }
    
}

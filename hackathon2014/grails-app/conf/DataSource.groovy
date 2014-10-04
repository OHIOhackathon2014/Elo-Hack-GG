dataSource {
    pooled = true
	url = "jdbc:mysql://localhost:3306/Hackathon2014"
    driverClassName = "com.mysql.jdbc.Driver"
    username = "root"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
/*environments {
    development {
        dataSource {
			pooled = true
	    	dbCreate = "update"
	    	url = "jdbc:mysql://localhost/yourDB"
	    	driverClassName = "com.mysql.jdbc.Driver"
	    	username = "root"
	    	password = ""
		}
    }
    test {
         dataSource {
			pooled = true
	    	dbCreate = "update"
	    	url = "jdbc:mysql://localhost/yourDB"
	    	driverClassName = "com.mysql.jdbc.Driver"
	    	username = "root"
	    	password = ""
		}
    }
    production {
          dataSource {
			pooled = true
	    	dbCreate = "update"
	    	url = "jdbc:mysql://localhost/yourDB"
	    	driverClassName = "com.mysql.jdbc.Driver"
	    	username = "root"
	    	password = ""
		}
        }
}

*/
FROM tomcat:latest
# Take the war and copy to webapps of tomcat
#COPY target/*.war /usr/local/tomcat/webapps/myweb.war
COPY target/*.war /usr/local/tomcat/webapps/myweb-0.0.7-SNAPSHOT.war

ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]

FROM tomcat
# Take the war and copy to webapps of tomcat
COPY target/*.war /usr/local/tomcat/webapps/myweb.war
ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]

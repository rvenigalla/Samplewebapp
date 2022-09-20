# get the base maven image
FROM maven as mvn

# copy other project files
COPY . .

# build the folder
RUN mvn clean package

# Handle Tomcat

FROM tomcat:9
COPY --from=mvn /target/*.war /usr/local/tomcat/webapps/

FROM liferay-data-hsdb

RUN mkdir -p /var/lib/mysql

VOLUME /var/lib/mysql

RUN echo 'jdbc.default.driverClassName=org.mysql.jdbc.Driver\njdbc.default.url=jdbc:mysql://localhost/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false\njdbc.default.username=root\njdbc.default.password=root' > /bundles/portal-ext.properties
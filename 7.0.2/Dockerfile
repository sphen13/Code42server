FROM mykro/java8-jre:latest

COPY run.sh /

RUN mkdir /code42server && \
	cd / && \
	curl -qL https://download.code42.com/installs/proserver/7.0.2/Code42server_7.0.2_Linux.tgz | tar xvz -C /code42server --strip-components=1 && \
	rm -f /Code42server* && \
	cd /code42server && \
	./install.sh -u --accept-eula && \
	chmod +x /run.sh && \
	rm -rf /code42server

EXPOSE 4280 4282 4285 4287

VOLUME ["/opt/proserver/db","/var/log/proserver","/var/opt/proserver"]

CMD ["/run.sh"]

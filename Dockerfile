FROM mykro/java8-jre:latest

RUN mkdir /code42server && \
	cd / && \
	wget -q https://download.code42.com/installs/proserver/6.5.2/Code42server_6.5.2_Linux.tgz && \
	tar -xzf Code42server_6.5.2_Linux.tgz -C /code42server --strip-components=1 && \
	rm -f /Code42server*

COPY run.sh /

RUN cd /code42server && \
	./install.sh -u --accept-eula && \
  chmod +x /run.sh

EXPOSE 4280 4282 4285 4287

VOLUME ["/opt/proserver/db","/var/log/proserver","/var/opt/proserver"]

CMD ["/run.sh"]

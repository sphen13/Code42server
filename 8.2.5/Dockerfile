FROM bridg/java8

ENV ROLE=authority

COPY run.sh /

RUN mkdir /code42server && \
	cd / && \
	curl -qL https://download.code42.com/installs/server/onprem/8.2.5/39/install/Code42server_8.2.5_Linux.tgz | tar xvz -C /code42server --strip-components=1 && \
	rm -f /Code42server* && \
	cd /code42server && \
	./install.sh -u --accept-eula --${ROLE} && \
	chmod +x /run.sh && \
	rm -rf /code42server

EXPOSE 4280 4285 4287

VOLUME ["/opt/proserver/db","/var/log/proserver","/var/opt/proserver"]

CMD ["/run.sh"]

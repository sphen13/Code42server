FROM ubuntu:xenial

COPY run.sh /

RUN apt-get update && \
	apt-get install --no-install-recommends -y software-properties-common curl && \
	add-apt-repository -y ppa:webupd8team/java && \
	apt-get update && \
	echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
	echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
	apt-get install -y oracle-java8-installer && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /code42server && \
	cd / && \
	curl -qL https://download.code42.com/installs/proserver/6.7.2/Code42server_6.7.2_Linux.tgz | tar xvz -C /code42server --strip-components=1 && \
	rm -f /Code42server* && \
	cd /code42server && \
	./install.sh -u --accept-eula && \
	chmod +x /run.sh && \
	rm -rf /code42server

EXPOSE 4280 4282 4285 4287

VOLUME ["/opt/proserver/db","/var/log/proserver","/var/opt/proserver"]

CMD ["/run.sh"]

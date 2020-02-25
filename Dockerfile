FROM sumikof/openstack-base

RUN apt -y install keystone 

ADD render_template.py /
RUN chmod u+x render_template.py
RUN mkdir /template

ADD entrypoint.sh /
RUN chmod u+x entrypoint.sh

CMD ["/entrypoint.sh"]

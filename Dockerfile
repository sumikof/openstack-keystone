FROM sumikof/openstack-base

RUN apt -y update && apt -y install \
      keystone \
 && apt clean

ADD apache2.conf.template /template
ADD logging.conf.template /template
ADD keystone.conf.template /template

ADD keystonerc_admin.template /template

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

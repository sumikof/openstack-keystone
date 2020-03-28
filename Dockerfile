FROM sumikof/openstack-base

RUN apt -y update && apt -y install \
      keystone \
 && apt clean

ADD /template/apache2.conf.template /template
ADD /template/logging.conf.template /template
ADD /template/keystone.conf.template /template

ADD /template/keystonerc_admin.template /template

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

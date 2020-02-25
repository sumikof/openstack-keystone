#!/bin/bash

echo "start render keystone.conf"
echo ./render_template.py keystone.conf.templ /etc/keystone/keystone.conf
./render_template.py keystone.conf.templ /etc/keystone/keystone.conf
echo "end render keystone.conf"

echo "start keystone-manage db_sync"
echo su -s /bin/bash keystone -c "keystone-manage db_sync"
su -s /bin/bash keystone -c "keystone-manage db_sync"
echo "end keystone-manage db_sync"

echo "start key setup"
echo keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
echo keystone-manage credential_setup --keystone-user keystone --keystone-group keystone
keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
keystone-manage credential_setup --keystone-user keystone --keystone-group keystone
echo "end key setup"

echo "start bootstrap"
echo keystone-manage bootstrap --bootstrap-password ${ADMIN_PASSWORD} \
	        --bootstrap-admin-url http://openstack-keystone:5000/v3/ \
		        --bootstrap-internal-url http://openstack-keystone:5000/v3/ \
			        --bootstrap-public-url http://openstack-keystone:5000/v3/ \
				        --bootstrap-region-id RegionOne
keystone-manage bootstrap --bootstrap-password ${ADMIN_PASSWORD} \
	--bootstrap-admin-url http://openstack-keystone:5000/v3/ \
	--bootstrap-internal-url http://openstack-keystone:5000/v3/ \
	--bootstrap-public-url http://openstack-keystone:5000/v3/ \
	--bootstrap-region-id RegionOne
echo "end bootstrap"

/etc/init.d/apache2 restart
echo "restarted apache2"

tail -f /var/log/apache2/keystone_access.log 

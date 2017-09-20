#
# Cookbook:: db
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
apt_update
package 'mongodb'

service 'mongodb' do 
	supports status: true, restart: true
	action [:enable, :start]
end

template '/etc/mongod.conf' do
	source 'mongo.conf.erb'
	
end

template '/lib/systemd/system/mongo.service' do
	source 'mongo.service.erb'
	action :create
end
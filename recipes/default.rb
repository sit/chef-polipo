#
# Cookbook Name:: polipo
# Recipe:: default
#
# Copyright 2012, Dan Midwood
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package "polipo" do
  action :install
end

template "/etc/polipo/config" do
  source "config.rb.erb"
  mode 0444
  owner "root"
  group "root"
  notifies :enable, "service[polipo]"
  notifies :start, "service[polipo]"
  variables({
      :proxy_address => node[:polipo][:proxy_address],
      :allowed_clients => node[:polipo][:allowed_clients],
      :log_level => node[:polipo][:log_level]
  })
end

service "polipo" do
  # polipo also supports :status. But chef appears to read all responses as "started". 
  # Removing status causes fallback "to process table inspection" (src: Debug log) and that correctly determines when the service isn't running.
  supports [ :start, :stop, :restart ]
  action [ :enable, :start ]
end

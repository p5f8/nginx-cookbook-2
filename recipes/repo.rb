#
# Cookbook Name:: nginx
# Recipe:: repo
# Author:: Nick Rycar <nrycar@bluebox.net>
#
# Copyright 2008-2013, Chef Software, Inc.
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

include_recipe 'apt::default'

apt_repository 'nginx' do
  uri          node['nginx']['upstream_repository']
  distribution 'stable'
  components   %w(main)
  key          'http://ops.evertrue.com.s3.amazonaws.com/debian-repo/evertrue.key'
end

ruby_block 're-run apt-get update' do
  block {}
  notifies :run, 'execute[apt-get update]'
end

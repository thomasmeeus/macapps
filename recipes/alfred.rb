#
# Cookbook Name:: macapps
# Recipe:: alfred
#
# Copyright 2013, Urbandecoder Labs LLC
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

remote_file "#{Chef::Config[:file_cache_path]}/Alfred_2.5.1_308.zip" do
  source 'http://cachefly.alfredapp.com/Alfred_2.5.1_308.zip'
  checksum '06e55eed65c3e09bffd385a11a695ebd7df79a5303690e9cb197a0b72782e2dc'
  notifies :run, "execute[unzip-alfred]", :immediately
end

execute "unzip-alfred" do
  command "unzip -o #{Chef::Config[:file_cache_path]}/Alfred_2.5.1_308.zip -d /Applications"
  action :nothing
end

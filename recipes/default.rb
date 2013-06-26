#
# Cookbook Name:: chef-play-demo
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

=begin
node.default.java = {
  'install_flavor' => 'oracle',
  'jdk_version' => '7',
  'arch' => 'x86_64',
  'oracle' => {
    'accept_oracle_download_terms' => true
  }
}
=end
node.default.java.install_flavor = 'oracle'
node.default.java.jdk_version = '7'
#node.default.java.arch = '7'
node.default.java.oracle.accept_oracle_download_terms = true

include_recipe "java::default"
include_recipe "play2::default"

package 'git' do
end

git "/opt/reactivemongo-demo-app" do
  repository "https://github.com/sgodbillon/reactivemongo-demo-app.git"
  reference "master"
  action :sync
end

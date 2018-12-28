# Cookbook:: node_n
# Recipe:: default

package 'npm'
execute "npm install -g n"
execute "n #{node[:node_n][:node][:version]}"


# Cookbook:: node_n
# Recipe:: default

package 'npm'
execute "npm install -g n"
execute "n 8.14.0"


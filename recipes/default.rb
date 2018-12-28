# Cookbook:: node_n
# Recipe:: default

package 'npm'
user_execute "npm install -g n"
user_execute "n 8.14.0"


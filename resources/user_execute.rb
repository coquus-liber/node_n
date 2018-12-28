# To learn more about Custom Resources, see https://docs.chef.io/custom_resources.html
resource_name :user_execute

property :command, String, name_property: true
property :user, String, default: lazy{ |r| ::Etc.getpwuid(1000).name }
property :usr, Etc::Passwd, default: lazy{ |r| ::Etc.getpwnam(r.user) }
property :grp, Etc::Group, default: lazy{ |r| ::Etc.getgrgid(r.usr.gid) }
property :group, String, default: lazy {|r| r.grp.name }
property :home, String, default: lazy {|r| r.usr.dir }
property :cwd, String, default: lazy {|r| r.home }
property :environment, Hash, default: lazy { |r|
      { 
        'HOME': r.home, 
        'USER': r.user, 
        'USERNAME': r.user, 
        'LOGNAME': r.user,
        'PATH': "/usr/local/bin:/usr/bin:/bin"
      }
    }

action :execute do
  execute 'install rvm' do
    cwd new_resource.cwd
    user new_resource.user
    group new_resource.group
    environment new_resource.environment
    command new_resource.command
    live_stream true
  end
end



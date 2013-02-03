require 'bundler/capistrano'

set :user, 'deploy'
set :runner, 'deploy'
set :domain, 'vps13396.ovh.net'
set :applicationdir, "/var/www/ideotron"
set :password, "nextone"
set :deploy_to, "/var/www/ideotron" # path where your code will be deployed
set :use_sudo, true

default_run_options[:pty] = true

set :application, "ideotron"
set :repository,  "/var/www/ideotron"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm, :git
set :repository, "git@github.com:herveleroy/ideotron.git"


# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

server domain, :web, :app, :db, :primary => true

# deploy strategy
set :deploy_via, :copy
set :copy_strategy, :export

# Add RVM's lib directory to the load path.
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

# Load RVM's capistrano plugin.
require "rvm/capistrano"

set :rvm_ruby_string, '1.9.3'
set :rvm_type, :user  # Don't use system-wide RVM
set :shell, '/bin/bash'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", "db:symlink",  "deploy:migrate"



# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
namespace :db do
  desc "Make symlink for database yaml"
  task :symlink do
    run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
  end
end

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  desc "Copy the database.yml file into the latest release"
  task :copy_in_database_yml do
    run "cp #{shared_path}/config/database.yml #{latest_release}/config/"
  end
end

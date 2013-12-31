require 'capistrano/ext/multistage'

default_run_options[:pty] = true
set :stages, ["staging", "production"]
set :default_stage, "production"

set :application, "clexane"

# You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm, :git
set :repository, "git@github.com:stam3/Clexane.git" #https://github.com/stam3/Clexane.git"
set :scm_passphrase, ""

set :user, "ec2-user"
#set :ssh_key, "/Users/davidsayag/Documents/Devel/RorProjects/KeyPairs/DudusClexaneKeyPair3.pem"
# set :ssh_options, {
#    # verbose: :debug,
#    user: fetch(:user)
# }
set :scm_verbose, true
ssh_options[:keys] = ["/Users/davidsayag/Documents/Devel/RorProjects/KeyPairs/DudusClexaneKeyPair3.pem"]
#set :ssh_options, { :forward_agent => true }
#set :use_sudo, false


# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
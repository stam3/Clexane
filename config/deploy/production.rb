server "ec2-54-201-219-43.us-west-2.compute.amazonaws.com", :app, :web, :db, :primary => true
set :deploy_to, '/var/www/clexane'
# set :user     "ec2-user"
# set :ssh_key  "/Users/davidsayag/Documents/Devel/RorProjects/KeyPairs/DudusClexaneKeyPair2.pem"
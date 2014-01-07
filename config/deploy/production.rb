server "ec2-54-200-200-253.us-west-2.compute.amazonaws.com", :app, :web, :db, :primary => true
set :deploy_to, '/var/www/clexane'
# set :user     "ec2-user"
# set :ssh_key  "/Users/davidsayag/Documents/Devel/RorProjects/KeyPairs/DudusClexaneKeyPair2.pem"
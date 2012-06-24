### This file contains stage-specific settings ###

# Set the repository type and location to deploy from.
# SCM Stuff configure to taste, just remember the repository
# here I used github as main repository
set :repository,  "git://github.com/youraccount/your_make_file.git"
set :scm, :git
set :scm_verbose,  true

#set the branch for the git repo of your make file (optional)
set :branch, "6.x-1.x-staging"

# Set the deployment directory on the target hosts.
set :application, "your.appname.staging"

# Point your apache web root to this directory for this app
set :deploy_to, "/path/to/your/app/#{application}"

# Linux user and group settings
set :user, "username_here"
set :group, "group_here"

# The hostnames to deploy to.
role :web, "example.com", :primary => true

set :drush, "/path/to/local/bin/drush --r=/path/to/www/your.appname.staging/current"

# Stage-specific tasks
namespace :stage_tasks do
  task :cleanup, :except => { :no_release => true } do
     # Make sure users don't accidentally get emailed from the dev server
    run "#{drush} vset --yes smtp_library sites\/all\/modules\/devel\/devel.module"
  end

  # Add your environment-specific symlinks
  task :symlink do
  end
end

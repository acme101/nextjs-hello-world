#
# Cookbook:: nextjs-hello-world
# Recipe:: setup_nextjs_hello_world
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# nextjs-hello-world project setup

# we need this because the guest path could change in the future
# instead of ~/workspace, it's likely that we'll use /mnt/workspace
cwd_path = node['acme']['nextjs-hello-world']['project_guest_path']


execute 'docker-compose pull' do
    cwd cwd_path
    command 'docker-compose pull --ignore-pull-failures'
end

# this is not needed after we have private registry, just login and pull, don't build
# execute 'docker-compose build dev' do
#     cwd cwd_path
#     command "docker-compose build dev"
# end

# get the dev service up by default
execute 'docker-compose up -d dev' do
    cwd cwd_path
    command 'docker-compose up -d dev'
end

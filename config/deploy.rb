lock '~> 3.6.1'

set :application, 'ruby-china'
set :repo_url, 'git://github.com/fushang318/ruby-china.git'
set :deploy_to, "/web/#{ fetch(:application) }"

set :rvm_ruby_version, '2.3.1'

set :puma_role, :app

set :puma_conf, "#{shared_path}/config/puma-web.rb"

append :linked_files, *%w(config/puma-web.rb config/secrets.yml config/database.yml config/config.yml
                          config/elasticsearch.yml config/oneapm.yml config/redis.yml)
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'public/assets'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 10

after 'deploy:publishing', 'deploy:restart'

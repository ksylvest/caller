require './app.rb'

use Rack::Cache,
  metastore:   "memcached://#{ENV["MEMCACHE_SERVERS"]}",
  entitystore: "memcached://#{ENV["MEMCACHE_SERVERS"]}",
  verbose: true

map '/assets' do
  run Assets.new
end

map '/' do
  run Sinatra::Application
end

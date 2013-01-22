require './app.rb'

if ENV["MEMCACHE_SERVERS"]
  use Rack::Cache,
    metastore:   "memcached://#{ENV["MEMCACHE_SERVERS"]}",
    entitystore: "memcached://#{ENV["MEMCACHE_SERVERS"]}",
    verbose: true
end

map '/assets' do
  run Assets.new
end

map '/' do
  run Sinatra::Application
end

require 'bundler'
Bundler.require :default

require './assets'

set :cache, 86400

helpers do
  def link(text, href = text)
    status = request.path.eql?(href) ? 'active' : 'inactive'
    "<a href='#{href}' class='#{status}'>#{text}</a>"
  end

  def asset(source)
    Assets.path(source)
  end

  def url(path)
    "#{request.scheme}://#{request.host}#{path}"
  end
end

get '/' do
  expires settings.cache, :public
  haml :index
end
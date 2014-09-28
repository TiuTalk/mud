require 'rubygems'
require 'bundler'

Bundler.require(:default, :development)

autoload :Server, File.expand_path('../../lib/server', __FILE__)
autoload :Client, File.expand_path('../../lib/client', __FILE__)

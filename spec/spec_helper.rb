require 'simplecov'
SimpleCov.start do
  minimum_coverage 100
  add_filter '/spec/'
end if ENV['coverage'] == 'on'

require File.expand_path('../../config/autoload', __FILE__)

RSpec.configure do |config|
  config.color = true
  config.tty = true

  # Supress STDOUT during specs
  config.before { allow($stdout).to receive(:puts) }
end

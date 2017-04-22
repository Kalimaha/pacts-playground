require 'bundler/setup'

ENV['RACK_ENV'] ||= ENV.fetch('RACK_ENV', 'development')

$LOAD_PATH.unshift File.expand_path('../../app', __FILE__)

require 'envied'
ENVied.require(*ENV['ENVIED_GROUPS'] || [:default, ENV['RACK_ENV']])

Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require_relative '../app'

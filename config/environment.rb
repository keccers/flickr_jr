ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'rake'
require 'shotgun'

require 'bcrypt'

# Image Uploading 
require 'mini_magick'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

# Styling
require 'sass'
require 'sass/plugin/rack'
require 'bourbon'
require 'neat'

# Testing
# require 'faker'
require 'pry'

require 'erb'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s


# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')

# Set up the uploaders
set :root, APP_ROOT
Dir[APP_ROOT.join('app', 'uploaders', '*.rb')].each { |file| require file }

# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

configure do
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  # Set the views to 
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Configure Sass
use Sass::Plugin::Rack
Sass::Plugin.options[:style] = :expanded

run Sinatra::Application

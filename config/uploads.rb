require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'mini_magick'

CarrierWave.configure do |config|
  config.store_dir = 'public/uploads/'
end

Dir[APP_ROOT.join('lib','*.rb')].each { |file| require file }

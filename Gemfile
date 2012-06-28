source 'http://rubygems.org'

# standard rails stuff
gem 'rails', '3.2.6'

# for pagination
gem 'will_paginate'

# ruby 1.9 does not parse dates formatted in american style correclty. This gem fixes that.
gem 'american_date'

# to override default error message that comes with validates_presence_of etla.
gem 'custom_error_message'

# to manage states of payment_status and shipping_status
gem 'state_machine'

# to handle payments
gem 'activemerchant'

# for uploading images
gem 'carrierwave'

# for uploading pictures to s3 using carrierwave
gem 'fog'

# for having nested items. order has billing_address and shipping_address nested
gem 'nested_form'

# for creating thumbnails for images
gem 'mini_magick'

# mustache.js. It is used to generate new product-group-condition
gem 'mustache'

# for validating email
gem 'email_validator', github: "bigbinary/email_validator"

# for security
gem 'strong_parameters'

# to make settings more flexible. Without hashr the code would be like this
#  Nimbleshop.config.s3['bucket_name']  .With hashr it becomes Nimbleshop.config.s3.bucket_name
#
#  I can't use open-struct because that does not list all the keys
#
gem 'hashr'

# This gem maintains all the country codes and subregions for some of the countries
gem 'carmen', '= 1.0.0.beta2'

# for displaying images of a product in facybox manner
gem 'fancybox-rails'

# for error notification
gem "airbrake"

# TODO this dependecy should be pushed to nimbleshop_paypalwp
#
# this gem is needed to handle the instant payment notification from paypal. In particular following
# ActiveMerchant::Billing::Integrations::Notification::Money class uses it .
gem 'money'

# for background processing of jobs
gem 'delayed_job_active_record'

# to see how many background jobs are yet to be processed
gem "delayed_job_admin"

# heroku cedar stack needs it. anyways it is faster than webrick
gem 'thin'

# Gems used only for assets and not required in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end

group :development, :test do
  gem 'sqlite3'
  gem 'debugger'
  gem 'push2heroku',  github: 'neerajdotname/push2heroku'
  gem 'localtunnel',  github: 'jalada/localtunnel'
end

group :production, :staging do
  gem 'pg'
end

group :test do
  gem 'guard-minitest'
  gem 'guard', '= 1.0.3'

  gem 'capybara'
  gem 'selenium-webdriver', '~>2.21'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem "launchy"

  gem "mocha", require: false

  # this gem makes it faster to find out when a file has changed. guard works faster with this gem
  #
  # Ideally the following gem definition should be as given below. However with that deployment
  # of the code on heroku fails. So We are using the version with RUBY_PLATFORM code.
  #
  # gem 'rb-fsevent' if RUBY_PLATFORM =~ /darwin/i
  gem 'rb-fsevent'

  # for fake data in testing
  gem 'faker'

  # for capture response from payment gateways like Authorize.net
  gem 'vcr'

  # vcr uses webmock
  gem 'webmock'
end


gem 'nimbleshop_paypalwp',         path: 'vendor/engines/nimbleshop_paypalwp'
gem 'nimbleshop_authorizedotnet',  path: 'vendor/engines/nimbleshop_authorizedotnet'
gem 'nimbleshop_splitable',        path: 'vendor/engines/nimbleshop_splitable'
gem 'nimbleshop_cod',              path: 'vendor/engines/nimbleshop_cod'
gem 'nimbleshop_simply',           path: 'vendor/engines/nimbleshop_simply'

gem 'nimbleshop_google_analytics', github: 'bigbinary/nimbleshop_google_analytics'

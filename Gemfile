source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.7'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#Add_my_gem!!!
  #Gem_administrator
  gem 'activeadmin'
  #End_Gem_administartor

  #Gem_user
  gem 'devise', ">= 4.7.1"
  #End_Gem_user

  #Gem_avatar
  #gem "paperclip", "~> 6.0.0"
  #End_Gem_avatar

  #Gem_edit_text
  #gem 'tinymce-rails'
  #End_Gem_edit_text

  #Gem_jquerry
  gem 'jquery-rails'
  #End_Gem_jquerry

  #Gem_bootstrap
  gem 'bootstrap', '~> 4.0.0'
  #End_Gem_bootstrap

  #Gem_Вибір_країни
  #gem 'country_select'
  #End_Gem_Вибір_країни

  #Gem_По-сторінковий_вивід
  #gem 'will_paginate', '~> 3.1.0'
  #gem 'order_as_specified'
  #End_Gem_По-сторінковий_вивід

  #Gem_search
  gem 'ransack'
  #End_Gem_search
#End_my_gem!!!

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

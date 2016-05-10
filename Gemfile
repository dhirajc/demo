source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use sqlite3 as the database for Active Record
gem 'execjs'
gem 'therubyracer'
gem 'devise'
gem 'pry'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
group :assets do
  gem 'jquery-ui-rails', '~> 4.2.1'
end
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem "paperclip", "~> 5.0.0.beta1"
gem 'rack-cors', :require => 'rack/cors'
gem 'toastr-rails'

group :development, :test do
	gem 'sqlite3'
  gem 'byebug'
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  # gem "awesome_print", require:"ap"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  group :production do
  	gem 'pg'
  	gem 'rails_12factor', '~> 0.0.3'
  end

end


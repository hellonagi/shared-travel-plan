source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.3'
gem 'bcrypt', '3.1.18'
gem 'bootsnap', '1.18.3', require: false
gem 'importmap-rails', '2.0.1'
gem 'jbuilder', '2.12.0'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.8', '>= 7.0.8.3'
gem 'sprockets-rails', '3.4.2'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails', '1.3.3'
gem 'turbo-rails', '2.0.5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Use Sass to process CSS
gem 'bootstrap', '5.3.3'
gem 'jquery-rails', '4.6.0'
gem 'sassc-rails', '2.1.2'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', '1.9.2', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 3.1', '>= 3.1.2'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console', '4.2.1'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'htmlbeautifier', '1.4.3'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara', '3.40.0'
  gem 'selenium-webdriver', '4.21.1'
end

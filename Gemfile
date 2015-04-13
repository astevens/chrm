source 'https://rubygems.org'

# Distribute your app as a gem
# gemspec

# Padrino Stable Gem
gem 'padrino', '0.12.5'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.12.5'
# end

# Server requirements
gem 'thin'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'

# Component requirements
gem 'sass'
gem 'haml'
gem 'mysql2'
gem 'sequel'
gem 'smarter_csv'

# Test requirements
group :test do
  gem 'rspec'
  gem 'rack-test', :require => 'rack/test'
end

group :development do
  gem 'pry'
  gem 'pry-padrino'
end

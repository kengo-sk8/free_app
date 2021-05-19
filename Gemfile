source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

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

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-unicorn'
  gem 'capistrano-rails-console'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
end

group :production do
  gem 'unicorn'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'listen'
gem "haml-rails" #htmlをhamlにする為、記述した
gem 'devise' #ユーザー
gem 'payjp' #クレジットカード
gem 'dotenv-rails' #.envの生成
gem 'pry-rails' #binding.pry
gem 'omniauth-facebook' #facebook
gem 'omniauth-google-oauth2' #google
gem "omniauth-rails_csrf_protection" #sns
gem 'font-awesome-sass' #アイコンの画像を挿入する為、記述した
gem 'carrierwave' #画像を保存する為に導入した
gem 'mini_magick' #画像を保存する為に導入した
gem 'jquery-rails' #JSを起動させる為に導入した
gem 'ancestry' #カテゴリーを作成する為、導入した
gem 'active_hash' #item、deviseの登録、出品画面で使用した。(各モデルに呼び出す値を記述した)
gem 'rails-i18n' #config/locales内にある〇〇.ja.ymlを起動させる為、導入した。(config/application.rbにconfig.i18n.default_locale = :jaを記載)
gem 'jquery-turbolinks'  #jsがリロードしないと起動しない為、このgemを導入した。これによりページ遷移後、JSが起動する。
gem 'fog-aws' #画像をアップロードする際、外部のストレージを選択しアップロードするのを補助してくれるGem
gem 'kaminari' #ページがいっぱいになると自動的に分けてくれる
gem 'gretel' #パンくず機能


# Rails 8 Starter App
[![Build Status](https://github.com/diowa/ruby3-rails8-flowbite-render/actions/workflows/ci.yml/badge.svg)](https://github.com/diowa/ruby3-rails8-flowbite-render/actions)
[![Code Climate](https://codeclimate.com/github/diowa/ruby3-rails8-flowbite-render/badges/gpa.svg)](https://codeclimate.com/github/diowa/ruby3-rails8-flowbite-render)
[![Coverage Status](https://coveralls.io/repos/github/diowa/ruby3-rails8-flowbite-render/badge.svg?branch=main)](https://coveralls.io/github/diowa/ruby3-rails8-flowbite-render?branch=main)

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

This is an opinionated starter web application based on the following technology stack:

* [Ruby 3.4.2][:ruby-url]
* [Rails 8.0.2][:ruby-on-rails-url]
* [Tailwind CSS 4.0.14][:tailwind-css-url]
* [Flowbite 3.1.2][:flowbite-url]
* [Puma][:puma-url]
* [PostgreSQL][:postgresql-url]
* [RSpec][:rspec-url]
* [Font Awesome SVG (via Iconmap)][:fontawesome-url]
* [RuboCop][:rubocop-url]
* [RuboCop RSpec][:rubocop-rspec-url]
* [stylelint][:stylelint-url]
* [i18n-tasks][:i18n-tasks-url]

[:flowbite-url]: https://flowbite.com/
[:fontawesome-url]: https://fontawesome.com
[:i18n-tasks-url]: https://github.com/glebm/i18n-tasks
[:postgresql-url]: https://www.postgresql.org
[:puma-url]: https://puma.io
[:rspec-url]: https://rspec.info
[:rubocop-rspec-url]: https://github.com/backus/rubocop-rspec
[:rubocop-url]: https://github.com/bbatsov/rubocop
[:ruby-on-rails-url]: https://rubyonrails.org
[:ruby-url]: https://www.ruby-lang.org/en/
[:stylelint-url]: https://stylelint.io
[:tailwind-css-url]: https://tailwindcss.com/
[:webpack-url]: https://webpack.js.org

Starter App is deployable on [Heroku](https://www.heroku.com/). Demo: https://ruby3-rails8-flowbite-render.herokuapp.com/

```Gemfile``` also contains a set of useful gems for performance, security, api building...

### Thread safety

We assume that this application is thread safe. If your application is not thread safe or you don't know, please set the minimum and maximum number of threads usable by puma on Heroku to 1:

```sh
$ heroku config:set RAILS_MAX_THREADS=1
```

### Heroku Platform API

This application supports fast setup and deploy via [app.json](https://devcenter.heroku.com/articles/app-json-schema):

```sh
$ curl -n -X POST https://api.heroku.com/app-setups \
-H "Content-Type:application/json" \
-H "Accept:application/vnd.heroku+json; version=3" \
-d '{"source_blob": { "url":"https://github.com/diowa/ruby3-rails8-flowbite-render/tarball/main/"} }'
```

More information: [Setting Up Apps using the Platform API](https://devcenter.heroku.com/articles/setting-up-apps-using-the-heroku-platform-api)

### Recommended add-ons

Heroku's [Production Check](https://blog.heroku.com/introducing_production_check) recommends the use of the following add-ons, here in the free version:

```sh
$ heroku addons:create newrelic:wayne # App monitoring
$ heroku config:set NEW_RELIC_APP_NAME="Rails 7 Starter App" # Set newrelic app name
$ heroku addons:create papertrail:choklad # Log monitoring
```

### Tuning Ruby's RGenGC

Generational GC (called RGenGC) was introduced from Ruby 2.1.0. RGenGC reduces marking time dramatically (about x10 faster). However, RGenGC introduce huge memory consumption. This problem has impact especially for small memory machines.

Ruby 2.1.1 introduced new environment variable RUBY_GC_HEAP_OLDOBJECT_LIMIT_FACTOR to control full GC timing. By setting this variable to a value lower than the default of 2 (we are using the suggested value of 1.3) you can indirectly force the garbage collector to perform more major GCs, which reduces heap growth.

```sh
$ heroku config:set RUBY_GC_HEAP_OLDOBJECT_LIMIT_FACTOR=1.3
```

More information: [Change the full GC timing](https://bugs.ruby-lang.org/issues/9607)

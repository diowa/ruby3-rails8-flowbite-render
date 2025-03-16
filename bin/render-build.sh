#!/usr/bin/env bash
# exit on error
set -o errexit

# Multiple Databases. This is not possible with `render.yaml`
# Ref: https://render.com/docs/postgresql-creating-connecting#adding-multiple-databases-to-a-single-instance
psql ${DATABASE_URL} "CREATE DATABASE ${DATABASE_NAME}_cache"
psql ${DATABASE_URL} "CREATE DATABASE ${DATABASE_NAME}_queue"
psql ${DATABASE_URL} "CREATE DATABASE ${DATABASE_NAME}_cable"

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# If you're using a Free instance type, you need to
# perform database migrations in the build command.
# Uncomment the following line:

bundle exec rails db:migrate

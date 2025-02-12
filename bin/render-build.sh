#!/usr/bin/env bash
# exit on error
set -o errexit

# Multiple Databases. This is not possible with `render.yaml`
# Ref: https://render.com/docs/postgresql-creating-connecting#adding-multiple-databases-to-a-single-instance
psql $DATABASE_URL "CREATE DATABASE ruby3_rails8_flowbite_render_production_cache"
psql $DATABASE_URL "CREATE DATABASE ruby3_rails8_flowbite_render_production_queue"
psql $DATABASE_URL "CREATE DATABASE ruby3_rails8_flowbite_render_production_cable"

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# If you're using a Free instance type, you need to
# perform database migrations in the build command.
# Uncomment the following line:

bundle exec rails db:migrate

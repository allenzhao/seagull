#!/bin/bash
export RAILS_ENV=production
git checkout .
git pull
git rev-parse HEAD > VERSION
chmod +x ./scripts/deploy.sh
bundle install --without test development integration
bundle exec rake db:migrate
bundle exec rake assets:precompile
touch ./tmp/restart.txt
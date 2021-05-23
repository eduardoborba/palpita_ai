# Palpita ai

TODO: Explain what the app is...

## Setup


Create databases
```
createdb palpita_ai_development
createdb palpita_ai_test
```

Install dependencies
```
gem install bundler
bundle install
yarn install
```

Run migrations

```
bundle exec rake db:migrate
```

Import teams from CSV file

```ruby
ImportTeamsJob.perform_now
```

Run rails server and sidekiq

```
bundle exec rails s
bundle exec sidekiq
```

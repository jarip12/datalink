bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec rake assets:precompile
bundle exec unicorn -p 3000 -c config/unicorn.rb

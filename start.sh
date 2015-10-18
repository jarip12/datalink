bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec rake assets:precompile
#service nginx reload
bundle exec unicorn -p 3000 -c config/unicorn.rb

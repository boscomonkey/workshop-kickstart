run("echo gem \"'rake'\" >> Gemfile")
run("echo group :test, :development do >> Gemfile")
run("echo  gem \"'rspec-rails'\" >> Gemfile")
run("echo  gem \"'capybara'\" >> Gemfile")
run("echo  gem \"'database_cleaner'\" >> Gemfile")
run("echo  gem \"'cucumber-rails'\" >> Gemfile")
run("echo  gem \"'cucumber'\" >> Gemfile")
run("echo  gem \"'launchy'\" >> Gemfile")
run("echo end >> Gemfile")

run("bundle install")

rake("db:migrate")

generate("rspec:install")

generate("cucumber:install --rspec --capybara")

run("rm -rf test")
run("rm -rf features")

git(:clone => "http://github.com/boscomonkey/workshop-features.git")
run("mv workshop-features features")
inside("features") { run("rm -rf .git") } 
inside("config") { run("echo default: --format pretty > cucumber.yml") }

require File.expand_path(File.join(Rails.root, 'config', 'environment'))

f = File.join(Rails.root, 'db','seeds/recommended.rb')
f1 = File.join(Rails.root, 'db','seeds/already_taken.rb')
puts "Loading from #{f}..."
exec("bundle exec rails r #{f} up && bundle exec rails r #{f1} up")
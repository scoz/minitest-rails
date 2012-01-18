require 'rake/testtask'

MINITEST_TASKS = %w(models controllers helpers mailers integration) #views

desc 'Runs all tests'
Rake::TestTask.new(sub => 'test:prepare') do |t|
  t.libs << 'test'
  t.pattern = []
  MINITEST_TASKS.each do |sub|
    t.pattern << "test/#{sub}/**/*_test.rb"
  end
  t.pattern = t.pattern.join(' ')
end

namespace :test do
  task :prepare do
    # Placeholder task for other Railtie and plugins to enhance. See Active Record for an example.
  end

  MINITEST_TASKS.each do |sub|
    Rake::TestTask.new(sub => 'test:prepare') do |t|
      t.libs << 'test'
      t.pattern = "test/#{sub}/**/*_test.rb"
    end
  end
end

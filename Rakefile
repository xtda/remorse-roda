task :environment do
  ENV['RACK_ENV'] ||= ARGV[1] || 'development'
  ARGV.clear

  require_relative './config/boot'
end

desc 'console'
task console: :environment do
  require 'irb'
  IRB.start
  exit!(0)
end

task c: :console


Dir.glob('./lib/tasks/**/*.rake').each { |task| load(task) }
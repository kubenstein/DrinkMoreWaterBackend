require './config/environment'

namespace :db do

  desc 'Run migrations'
  task :migrate do
    Sequel.extension :migration
    Sequel::Migrator.run(DB, './db/migrate')
  end

  desc 'Load the seed data from db/seeds.rb'
  task :seeds do
    load(File.join('db/seeds.rb'))
  end

end
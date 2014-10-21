require './config/environment'

namespace :db do
  desc 'Run migrations'

  task :migrate do
    Sequel.extension :migration
    Sequel::Migrator.run(DB, './db/migrate')
  end

end
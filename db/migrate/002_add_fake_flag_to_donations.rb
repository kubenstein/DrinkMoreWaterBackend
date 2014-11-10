class AddFakeFlagToDonations < Sequel::Migration
  def up
    alter_table :donations do
      add_column :fake, FalseClass
    end
  end
end
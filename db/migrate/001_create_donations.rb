class CreateDonations < Sequel::Migration
  def up
    create_table(:donations) do
      primary_key :id
      String :name
      DateTime :created_at
    end
  end
end
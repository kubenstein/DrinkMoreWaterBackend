Hanami::Model.migration do
  change do
    create_table :donations do
      primary_key :id
      column :name, String, null: false
      column :created_at, DateTime, null: false
      column :fake, FalseClass, null: false
    end
  end
end

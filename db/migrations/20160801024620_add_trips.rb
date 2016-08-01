Hanami::Model.migration do
  change do
    create_table :trips do
      primary_key :id

      column :name,       String, null: false
      column :start_date, Date
      column :end_date,   Date
      column :user_id,    Integer, null: false
    end
  end
end

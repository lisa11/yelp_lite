class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.integer :restaurants_id
      t.integer :accounts_id

      t.timestamps

    end
  end
end

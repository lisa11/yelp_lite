class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.integer :restaurants_id
      t.integer :tag_id

      t.timestamps

    end
  end
end

class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :restaurants_id
      t.integer :account_id
      t.integer :stars
      t.text :content

      t.timestamps

    end
  end
end

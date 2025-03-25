class CreateBuyers < ActiveRecord::Migration[7.1]
  def change
    create_table :buyers do |t|
      t.integer :post_code,     null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :street_address, null: false
      t.string :building
      t.string :telephone,      null: false
      t.references :order,      null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateSaunas < ActiveRecord::Migration[6.1]
  def change
    create_table :saunas do |t|
      t.string :title
      t.text :address
      t.float :price
      t.integer :capacity
      t.string :image_url
      t.text :description
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

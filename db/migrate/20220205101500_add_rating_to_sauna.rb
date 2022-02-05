class AddRatingToSauna < ActiveRecord::Migration[6.1]
  def change
    add_column :saunas, :rating, :integer
  end
end

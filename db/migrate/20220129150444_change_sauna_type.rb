class ChangeSaunaType < ActiveRecord::Migration[6.1]
  def change
    rename_column :saunas, :type, :sauna_type
  end
end

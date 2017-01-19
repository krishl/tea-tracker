class ChangeColumnTypes < ActiveRecord::Migration[5.0]
  def change
    change_column :teas, :brew_time, :string
    change_column :teas, :temperature, :string
    change_column :teas, :grams, :string
    change_column :teas, :servings, :string
  end
end

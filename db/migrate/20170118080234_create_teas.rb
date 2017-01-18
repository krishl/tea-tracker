class CreateTeas < ActiveRecord::Migration[5.0]
  def change
    create_table :teas do |t|
      t.string :type
      t.date :purchase_date
      t.integer :brew_time
      t.integer :temperature
      t.integer :grams
      t.integer :servings
    end
  end
end

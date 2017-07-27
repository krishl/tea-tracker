class RenamePurchaseDate < ActiveRecord::Migration[5.0]
  def change
    change_column :teas, :purchase_date, :string
  end
end

class AddName < ActiveRecord::Migration[5.0]
  def change
    add_column :teas, :name, :string
  end
end

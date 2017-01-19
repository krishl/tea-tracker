class RenameType < ActiveRecord::Migration[5.0]
  def change
    rename_column :teas, :type, :kind
  end
end

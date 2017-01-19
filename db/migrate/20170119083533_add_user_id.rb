class AddUserId < ActiveRecord::Migration[5.0]
  def change
    add_column :teas, :user_id, :integer
  end
end

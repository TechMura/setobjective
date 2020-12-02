class AddUserIdToObjectives < ActiveRecord::Migration[6.0]
  def change
    add_column :objectives, :user_id, :integer
  end
end

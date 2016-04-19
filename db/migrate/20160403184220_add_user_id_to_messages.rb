class AddUserIdToMessages < ActiveRecord::Migration
  def up
    add_column :messages, :user_id, :integer, index:true
  end

  def down
    remove_column :messages, :user_id
  end
end

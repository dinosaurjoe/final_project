class AddUserMessageToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :user_message, :text
  end
end

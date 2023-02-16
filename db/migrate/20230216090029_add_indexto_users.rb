class AddIndextoUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, [:last_name, :email, :phone_number], 
      name: "index_users_on_email_phone_number_last_name", unique: true
  end
end

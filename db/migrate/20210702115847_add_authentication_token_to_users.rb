class AddAuthenticationTokenToUsers < ActiveRecord::Migration[5.2]
  def up
    change_table :users do |t|
      t.string :authentication_token
    end

    add_index  :users, :authentication_token, :unique => true
  end

  def down
    remove_column :users, :authentication_token
  end
end

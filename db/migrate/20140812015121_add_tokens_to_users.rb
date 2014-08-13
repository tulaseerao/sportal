class AddTokensToUsers < ActiveRecord::Migration
  def change
    add_column :users, :note_to_registra, :text
    add_column :users, :auth_token, :string
  end
end

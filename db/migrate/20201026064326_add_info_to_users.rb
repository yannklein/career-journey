class AddInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :batch, :integer
    add_column :users, :github_account, :string
  end
end

class AddCompletedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :completed, :boolean, default: false
  end
end

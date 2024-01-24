class AddVideoToStep < ActiveRecord::Migration[6.0]
  def change
    add_column :steps, :video, :string
  end
end

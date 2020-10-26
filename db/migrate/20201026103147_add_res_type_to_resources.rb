class AddResTypeToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :res_type, :string
  end
end

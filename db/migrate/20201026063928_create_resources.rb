class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :description
      t.string :url
      t.references :step

      t.timestamps
    end
  end
end

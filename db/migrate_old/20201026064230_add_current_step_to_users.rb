class AddCurrentStepToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :step, foreign_key: true
  end
end

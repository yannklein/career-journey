class AddStepNumberToSteps < ActiveRecord::Migration[6.0]
  def change
    add_column :steps, :step_number, :integer
  end
end

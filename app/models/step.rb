class Step < ApplicationRecord
  self.table_name = "career_steps"
  has_many :users, foreign_key: "career_step_id"
  has_many :resources, foreign_key: "career_step_id"
end

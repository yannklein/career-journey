class Resource < ApplicationRecord
  self.table_name = "career_resources"
  belongs_to :step, foreign_key: "career_step_id"
end

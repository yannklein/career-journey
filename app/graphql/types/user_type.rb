module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :encrypted_password, String, null: false
    field :reset_password_token, String, null: true
    field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime, null: true
    field :remember_created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :step_id, Integer, null: true
    field :name, String, null: true
    field :batch, Integer, null: true
    field :github_account, String, null: true
    field :step, Types::StepType, null: false
    field :completed, Boolean, null: false
  end
end

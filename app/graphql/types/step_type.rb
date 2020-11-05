module Types
  class StepType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :description, String, null: true
    field :video, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :step_number, Integer, null: true
    field :resources, [Types::ResourceType], null: true
    field :users, [Types::UserType], null: true
  end
end

module Types
  class QueryType < Types::BaseObject
    field :steps,
          [Types::StepType],
          null: false,
          description: "Returns the list of career journey steps"
    field :users,
          [Types::UserType],
          null: false,
          description: "Returns the list of users"

    def steps
      Step.all
    end
    def users
      User.all
    end
  end
end

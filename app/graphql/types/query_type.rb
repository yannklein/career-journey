module Types
  class QueryType < Types::BaseObject
    field :steps, [Types::StepType], null: false do
      description "Returns the list of career journey steps"
      argument :order_by, String, required: false
    end
    field :users,
          [Types::UserType],
          null: false,
          description: "Returns the list of users"

    def steps(order_by:)
      # order_by = {step_number: :desc}
      order_by ? Step.order(order_by) : Step.all
    end
    def users
      User.all
    end
  end
end

module Types
  class QueryType < Types::BaseObject

    field :steps, [Types::StepType], null: false do
      description "Returns the list of career journey steps"
      argument :order_by, String, required: false
    end

    field :step, Types::StepType, null: false do
      description "Returns one career journey steps"
      argument :stepId, Integer, required: true
    end

    field :users, [Types::UserType], null: false do
      description "Returns the list of users"
    end

    field :me, Types::UserType, null: true

    def steps(order_by: nil)
      # order_by = {step_number: :desc}
      # context[:current_user].steps
      order_by ? Step.order(order_by) : Step.all
    end

    def step(stepId: 0)
      Step.find(stepId)
    end

    def users
      User.all
    end

    def me
      context[:current_user]
    end
  end
end

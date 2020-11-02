module Types
  class QueryType < Types::BaseObject

    field :steps, [Types::StepType], null: false do
      description "Returns the list of career journey steps"
      argument :order_by, String, required: false
      # resolve ->(obj, args, context) {
      #   context[:current_user].steps
      # }
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

    def users
      User.all
    end

    def me
      context[:current_user]
    end
  end
end

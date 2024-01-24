module Mutations
  class UpdateUserStepId < BaseMutation
    # arguments passed to the `resolve` method
    argument :stepNb, Integer, required: true

    # return type from the mutation
    type Types::UserType

    def resolve(stepNb: 0)
      my_user = context[:current_user]
      if stepNb > Step.maximum("step_number")
        my_user.update(completed: true)
      else
        my_user.update(step: Step.find_by(step_number: stepNb), completed: false)
      end
      context[:current_user]
    end
  end
end

# mutation {
#   updateUserStepId(stepNb: 10) {
#     id
#     stepId
#   }
# }

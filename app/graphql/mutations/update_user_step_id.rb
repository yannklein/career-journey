module Mutations
  class UpdateUserStepId < BaseMutation
    # arguments passed to the `resolve` method
    argument :stepId, Integer, required: true

    # return type from the mutation
    type Types::UserType

    def resolve(stepId: 0)
      my_user = context[:current_user]
      my_user.update!(step_id: stepId)
      context[:current_user]
    end
  end
end

# mutation {
#   updateUserStepId(stepId: 10) {
#     id
#     stepId
#   }
# }

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end

  class QueryType < Types::BaseObject
    field :steps,
          [Types::StepType],
          null: false,
          description: "Returns the list of career journey steps"

    def steps
      Step.all
    end
  end
end

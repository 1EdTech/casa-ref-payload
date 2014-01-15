require 'casa/payload/schema_object'

module CASA
  module Payload
    class TransitPayloadAttributesSection < SchemaObject

      self.schema!({
        'type' => 'object',
        'patternProperties' => {
          '^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$' => {
            'type' => [
              'array',
              'boolean',
              'integer',
              'null',
              'number',
              'object',
              'string'
            ]
          }
        },
        'additionalProperties' => false,
        'default' => {}
      })

    end
  end
end
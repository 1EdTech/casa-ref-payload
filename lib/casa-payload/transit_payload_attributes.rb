require 'casa-payload/schema_object'
require 'casa-payload/abstract_payload_attributes'

module CASA
  module Payload
    class TransitPayloadAttributes < SchemaObject
        
      self.schema!({
        'title' => 'TransitPayloadAttributes',
        'type' => 'object',
        'properties' => AbstractPayloadAttributes.schema['properties'].merge({
          'use' => {
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
          },
          'require' => {
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
          }
        }),
        'required' => AbstractPayloadAttributes.schema['required'],
        'additionalProperties' => false
      })

    end
  end
end
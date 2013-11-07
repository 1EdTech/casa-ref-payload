require 'casa-payload/schema_object'
require 'casa-payload/abstract_payload_attributes'

module CASA
  module Payload
    class LocalPayloadAttributes < SchemaObject
        
      self.schema!({
        'title' => 'LocalPayloadAttributes',
        'type' => 'object',
        'properties' => AbstractPayloadAttributes.schema['properties'].merge({
          'use' => {
            'type' => 'object',
            'default' => {}
          },
          'require' => {
              'type' => 'object',
              'default' => {}
          }
        }),
        'required' => AbstractPayloadAttributes.schema['required'],
        'additionalProperties' => false
      })

    end
  end
end
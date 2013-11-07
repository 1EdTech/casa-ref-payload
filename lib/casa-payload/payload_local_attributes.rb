require 'casa-payload/schema_object'
require 'casa-payload/payload_abstract_attributes'

module CASA
  module Payload
    class PayloadLocalAttributes < SchemaObject
        
      self.schema!({
        'title' => 'PayloadLocalAttributes',
        'type' => 'object',
        'properties' => PayloadAbstractAttributes.schema['properties'].merge({
          'use' => {
            'type' => 'object',
            'default' => {}
          },
          'require' => {
              'type' => 'object',
              'default' => {}
          }
        }),
        'required' => PayloadAbstractAttributes.schema['required'],
        'additionalProperties' => false
      })

    end
  end
end
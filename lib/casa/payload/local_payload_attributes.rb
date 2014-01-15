require 'casa/payload/schema_object'
require 'casa/payload/abstract_payload_attributes'
require 'casa/payload/local_payload_attributes_section'

module CASA
  module Payload
    class LocalPayloadAttributes < SchemaObject
        
      self.schema!({
        'title' => 'LocalPayloadAttributes',
        'type' => 'object',
        'properties' => AbstractPayloadAttributes.schema['properties'].merge({
          'use' => LocalPayloadAttributesSection.schema,
          'require' => LocalPayloadAttributesSection.schema
        }),
        'required' => AbstractPayloadAttributes.schema['required'],
        'additionalProperties' => false
      })

    end
  end
end
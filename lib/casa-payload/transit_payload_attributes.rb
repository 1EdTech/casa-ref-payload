require 'casa-payload/schema_object'
require 'casa-payload/abstract_payload_attributes'
require 'casa-payload/transit_payload_attributes_section'

module CASA
  module Payload
    class TransitPayloadAttributes < SchemaObject
        
      self.schema!({
        'title' => 'TransitPayloadAttributes',
        'type' => 'object',
        'properties' => AbstractPayloadAttributes.schema['properties'].merge({
          'use' => TransitPayloadAttributesSection.schema,
          'require' => TransitPayloadAttributesSection.schema
        }),
        'required' => AbstractPayloadAttributes.schema['required'],
        'additionalProperties' => false
      })

    end
  end
end
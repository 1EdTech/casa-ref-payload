require 'casa/payload/schema_object'

module CASA
  module Payload
    class AbstractPayloadAttributes < SchemaObject
        
      self.schema!({
        'title' => 'AbstractPayloadAttributes',
        'type' => 'object',
        'properties' => {
          'timestamp' => {
            'type' => 'string',
            'format' => 'date-time'
          },
          'uri' => {
            'type' => 'string',
            'format' => 'uri'
          },
          'share' => {
            'type' => 'boolean',
            'default' => true
          },
          'propagate' => {
            'type' => 'boolean',
            'default' => true
          }
        },
        'required' => [
          'timestamp',
          'uri',
          'share',
          'propagate'
        ],
        'additionalProperties' => false
      })

    end
  end
end
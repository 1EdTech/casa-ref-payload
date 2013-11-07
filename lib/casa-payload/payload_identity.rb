require 'casa-payload/schema_object'

module CASA
  module Payload
    class PayloadIdentity < SchemaObject
        
      self.schema!({
        'title' => 'PayloadIdentity',
        'type' => 'object',
        'properties' => {
          'id' => {
            'type' => 'string'
          },
          'originator_id' => {
            'type' => 'string',
            'pattern' => '^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$'
          }
        },
        'required' => [
          'id',
          'originator_id'
        ],
        'additionalProperties' => false
      })
      
    end
  end
end


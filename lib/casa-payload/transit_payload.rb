require 'casa-payload/schema_object'
require 'casa-payload/payload_identity'
require 'casa-payload/transit_payload_attributes'
require 'casa-payload/transit_payload_journal'

module CASA
  module Payload
    class TransitPayload < SchemaObject
      
      self.schema!({
        'title' => 'TransitPayload',
        'type' => 'object',
        'properties' => {
          'identity' => PayloadIdentity.schema,
          'journal' => TransitPayloadJournal.schema,
          'original' => TransitPayloadAttributes.schema
        },
        'required' => [
          'identity',
          'original'
        ]
      })
      
    end
  end
end

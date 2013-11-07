require 'casa-payload/schema_object'
require 'casa-payload/payload_identity'
require 'casa-payload/local_payload_attributes'
require 'casa-payload/local_payload_journal'

module CASA
  module Payload
    class LocalPayload < SchemaObject
      
      self.schema!({
        'title' => 'LocalPayload',
        'type' => 'object',
        'properties' => {
          'identity' => PayloadIdentity.schema,
          'attributes' => LocalPayloadAttributes.schema,
          'journal' => LocalPayloadJournal.schema,
          'original' => LocalPayloadAttributes.schema
        },
        'required' => [
          'identity',
          'attributes'
        ]
      })
      
    end
  end
end

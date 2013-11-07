require 'casa-payload/schema_object'
require 'casa-payload/payload_identity'
require 'casa-payload/payload_local_attributes'
require 'casa-payload/payload_local_journal'

module CASA
  module Payload
    class LocalPayload < SchemaObject
      
      self.schema!({
        'title' => 'LocalPayload',
        'type' => 'object',
        'properties' => {
          'identity' => PayloadIdentity.schema,
          'attributes' => PayloadLocalAttributes.schema,
          'journal' => PayloadLocalJournal.schema,
          'original' => PayloadLocalAttributes.schema
        },
        'required' => [
          'identity',
          'attributes'
        ]
      })
      
    end
  end
end

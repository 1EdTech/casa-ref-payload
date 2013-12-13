require 'casa-payload/schema_object'
require 'casa-payload/abstract_payload_journal_entry'
require 'casa-payload/local_payload_attributes_section'

module CASA
  module Payload
    class LocalPayloadJournalEntry < SchemaObject
        
      self.schema!({
        'title' => 'LocalPayloadJournalEntry',
        'type' => 'object',
        'properties' => AbstractPayloadJournalEntry.schema['properties'].merge({
          'use' => LocalPayloadAttributesSection.schema,
          'require' => LocalPayloadAttributesSection.schema
        }),
        'required' => AbstractPayloadJournalEntry.schema['required'],
        'additionalProperties' => false
      })

    end
  end
end
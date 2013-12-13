require 'casa-payload/schema_object'
require 'casa-payload/abstract_payload_journal_entry'
require 'casa-payload/transit_payload_attributes_section'

module CASA
  module Payload
    class TransitPayloadJournalEntry < SchemaObject

      self.schema!({
        'title' => 'TransitPayloadJournalEntry',
        'type' => 'object',
        'properties' => AbstractPayloadJournalEntry.schema['properties'].merge({
          'use' => TransitPayloadAttributesSection.schema,
          'require' => TransitPayloadAttributesSection.schema
        }),
        'required' => AbstractPayloadJournalEntry.schema['required'],
        'additionalProperties' => false
      })

    end
  end
end
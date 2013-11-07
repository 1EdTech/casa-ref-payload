require 'casa-payload/schema_object'
require 'casa-payload/abstract_payload_journal_entry'

module CASA
  module Payload
    class LocalPayloadJournalEntry < SchemaObject
        
      self.schema!({
        'title' => 'LocalPayloadJournalEntry',
        'type' => 'object',
        'properties' => AbstractPayloadJournalEntry.schema['properties'].merge({
          'use' => {
            'type' => 'object',
            'default' => {}
          },
          'require' => {
              'type' => 'object',
              'default' => {}
          }
        }),
        'required' => AbstractPayloadJournalEntry.schema['required'],
        'additionalProperties' => false
      })

    end
  end
end
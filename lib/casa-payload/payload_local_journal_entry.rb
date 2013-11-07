require 'casa-payload/schema_object'
require 'casa-payload/payload_abstract_journal_entry'

module CASA
  module Payload
    class PayloadLocalJournalEntry < SchemaObject
        
      self.schema!({
        'title' => 'PayloadLocalJournalEntry',
        'type' => 'object',
        'properties' => PayloadAbstractJournalEntry.schema['properties'].merge({
          'use' => {
            'type' => 'object',
            'default' => {}
          },
          'require' => {
              'type' => 'object',
              'default' => {}
          }
        }),
        'required' => PayloadAbstractJournalEntry.schema['required'],
        'additionalProperties' => false
      })

    end
  end
end
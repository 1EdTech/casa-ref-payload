require 'casa-payload/schema_object'
require 'casa-payload/abstract_payload_journal_entry'

module CASA
  module Payload
    class TransitPayloadJournalEntry < SchemaObject
        
      self.schema!({
        'title' => 'TransitPayloadJournalEntry',
        'type' => 'object',
        'properties' => AbstractPayloadJournalEntry.schema['properties'].merge({
          'use' => {
            'type' => 'object',
            'patternProperties' => {
              '^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$' => {
                'type' => [
                  'array',
                  'boolean',
                  'integer',
                  'null',
                  'number',
                  'object',
                  'string'
                ]
              }
            },
            'additionalProperties' => false,
            'default' => {}
          },
          'require' => {
              'type' => 'object',
              'patternProperties' => {
                '^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$' => {
                  'type' => [
                    'array',
                    'boolean',
                    'integer',
                    'null',
                    'number',
                    'object',
                    'string'
                  ]
                }
              },
              'additionalProperties' => false,
              'default' => {}
          }
        }),
        'required' => AbstractPayloadJournalEntry.schema['required'],
        'additionalProperties' => false
      })

    end
  end
end
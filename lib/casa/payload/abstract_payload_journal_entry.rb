require 'casa/payload/schema_object'

module CASA
  module Payload
    class AbstractPayloadJournalEntry < SchemaObject
        
      self.schema!({
        'title' => 'AbstractPayloadJournalEntry',
        'type' => 'object',
        'properties' => {
          'originator_id' => {
            'type' => 'string',
            'pattern' => '^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$'
          },
          'timestamp' => {
            'type' => 'string',
            'format' => 'date-time'
          }
        },
        'required' => [
          'originator_id',
          'timestamp'
        ],
        'additionalProperties' => false
      })

    end
  end
end
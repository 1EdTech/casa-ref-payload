require 'casa/payload/schema_object'
require 'casa/payload/transit_payload_journal_entry'

module CASA
  module Payload
    class TransitPayloadJournal < SchemaObject
      
      self.schema!({
        'title' => 'TransitPayloadJournal',
        'type' => 'array',
        'items' => TransitPayloadJournalEntry.schema
      })
      
    end
  end
end

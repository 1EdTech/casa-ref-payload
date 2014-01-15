require 'casa/payload/schema_object'
require 'casa/payload/local_payload_journal_entry'

module CASA
  module Payload
    class LocalPayloadJournal < SchemaObject
      
      self.schema!({
        'title' => 'LocalPayloadJournal',
        'type' => 'array',
        'items' => LocalPayloadJournalEntry.schema
      })
      
    end
  end
end

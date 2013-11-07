require 'casa-payload/schema_object'
require 'casa-payload/payload_local_journal_entry'

module CASA
  module Payload
    class PayloadLocalJournal < SchemaObject
      
      self.schema!({
        'title' => 'PayloadLocalJournal',
        'type' => 'array',
        'items' => PayloadLocalJournalEntry.schema
      })
      
    end
  end
end

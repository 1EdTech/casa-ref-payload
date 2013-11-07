require 'test/unit'
require 'casa-payload'
require 'hashdiff'

class TestLocalPayloadJournal < Test::Unit::TestCase

  include CASA::Payload

  def test_requirements

    assert HashDiff.diff(LocalPayloadJournal.schema['items'], LocalPayloadJournalEntry.schema).size == 0
    assert LocalPayloadJournal.schema['type'] == 'array'

  end

end
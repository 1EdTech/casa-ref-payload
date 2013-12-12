require 'test/unit'
require 'casa-payload'
require 'hashdiff'

class TestTransitPayloadJournal < Test::Unit::TestCase

  include CASA::Payload

  def test_requirements

    assert HashDiff.diff(TransitPayloadJournal.schema['items'], TransitPayloadJournalEntry.schema).size == 0
    assert TransitPayloadJournal.schema['type'] == 'array'

  end

end
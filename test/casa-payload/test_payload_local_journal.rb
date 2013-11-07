require 'test/unit'
require 'casa-payload'
require 'hashdiff'

class TestPayloadLocalJournal < Test::Unit::TestCase

  include CASA::Payload

  def test_requirements

    assert HashDiff.diff(PayloadLocalJournal.schema['items'], PayloadLocalJournalEntry.schema).size == 0
    assert PayloadLocalJournal.schema['type'] == 'array'

  end

end
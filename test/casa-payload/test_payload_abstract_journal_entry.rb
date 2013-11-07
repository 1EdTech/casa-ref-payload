require 'test/unit'
require 'casa-payload'
require 'json-schema'

class TestPayloadAbstractJournalEntry < Test::Unit::TestCase

  include CASA::Payload

  def test_requirements cls = PayloadAbstractJournalEntry

    assert_raise JSON::Schema::ValidationError, "Missing required originator_id attribute" do
      cls.new({
        'timestamp' => '1996-12-19T16:39:57-08:00'
      }).to_hash
    end

    assert_raise JSON::Schema::ValidationError, "Missing required timestamp attribute" do
      cls.new({
        'originator_id' => 'f5b28107-e2c7-46f9-b2fc-34974ede7083'
      }).to_hash
    end

    assert_raise JSON::Schema::ValidationError, "Invalid timestamp attribute" do
      cls.new({
        'originator_id' => 'f5b28107-e2c7-46f9-b2fc-34974ede7083',
        'timestamp' => 'January 19, 2013'
      }).to_hash
    end

    assert_nothing_raised "All required attributes specified" do
      cls.new({
        'originator_id' => 'f5b28107-e2c7-46f9-b2fc-34974ede7083',
        'timestamp' => '1996-12-19T16:39:57-08:00'
      }).to_hash
    end

  end

end
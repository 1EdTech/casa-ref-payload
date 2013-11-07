require 'test/unit'
require 'casa-payload'
require 'json-schema'

class TestPayloadLocalJournalEntry < TestPayloadAbstractJournalEntry

  include CASA::Payload

  def test_requirements cls = PayloadLocalJournalEntry

    super cls

    [true, false, '', []].each do |invalid_type|
      ['use','require'].each do |section|
        assert_raise JSON::Schema::ValidationError, "Invalid use attribute" do
          cls.new({
            'originator_id' => 'f5b28107-e2c7-46f9-b2fc-34974ede7083',
            'timestamp' => 'January 19, 2013',
            section => invalid_type
          }).to_hash
        end
      end
    end

    assert_nothing_raised "All required attributes specified" do
      cls.new({
        'originator_id' => 'f5b28107-e2c7-46f9-b2fc-34974ede7083',
        'timestamp' => '1996-12-19T16:39:57-08:00',
        'use' => {
            'attr' => true
        },
        'require' => {
            'attr' => true
        }
      }).to_hash
    end

  end

end
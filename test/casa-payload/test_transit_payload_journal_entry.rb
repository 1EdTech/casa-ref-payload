require 'test/unit'
require 'casa-payload'
require 'json-schema'

class TestTransitPayloadJournalEntry < TestLocalPayloadJournalEntry

  include CASA::Payload

  def test_requirements cls = TransitPayloadJournalEntry

    super cls

    ['use','require'].each do |type|
      assert_raise JSON::Schema::ValidationError do
        cls.new({
          'originator_id' => 'f5b28107-e2c7-46f9-b2fc-34974ede7083',
          'timestamp' => '1996-12-19T16:39:57-08:00',
          type => {
              'attr' => true
          }
        }).to_hash
      end
    end

  end

end
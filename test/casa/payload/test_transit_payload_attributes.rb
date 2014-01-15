require 'test/unit'
require 'casa/payload'
require 'json-schema'

class TestTransitPayloadAttributes < TestLocalPayloadAttributes

  include CASA::Payload

  def test_requirements cls = TransitPayloadAttributes

    super cls

    ['use','require'].each do |type|
      assert_raise JSON::Schema::ValidationError do
        cls.new({
          'timestamp' => '1996-12-19T16:39:57-08:00',
          'uri' => 'http://example.com',
          'share' => true,
          'propagate' => true,
          type => {
              'attr' => true
          }
        }).to_hash
      end
    end

  end

end
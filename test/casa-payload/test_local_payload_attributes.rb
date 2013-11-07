require 'test/unit'
require 'casa-payload'
require 'json-schema'

class TestLocalPayloadAttributes < TestAbstractPayloadAttributes

  include CASA::Payload

  def test_requirements cls = LocalPayloadAttributes

    super cls

    [true, false, '', []].each do |invalid_type|
      ['use','require'].each do |section|
        assert_raise JSON::Schema::ValidationError, "Invalid use attribute" do
          cls.new({
            'timestamp' => '1996-12-19T16:39:57-08:00',
            'uri' => 'http://example.com',
            'share' => true,
            'propagate' => true,
            section => invalid_type
          }).to_hash
        end
      end
    end

    assert_nothing_raised "All required attributes specified" do
      cls.new({
        'timestamp' => '1996-12-19T16:39:57-08:00',
        'uri' => 'http://example.com',
        'share' => true,
        'propagate' => true,
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
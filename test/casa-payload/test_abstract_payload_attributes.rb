require 'test/unit'
require 'casa-payload'
require 'json-schema'

class TestAbstractPayloadAttributes < Test::Unit::TestCase

  include CASA::Payload

  def test_requirements cls = AbstractPayloadAttributes

    assert_raise JSON::Schema::ValidationError, "Missing required timestamp attribute" do
      cls.new({
        'uri' => 'http://example.com',
        'share' => true,
        'propagate' => true
      }).to_hash
    end

    assert_raise JSON::Schema::ValidationError, "Invalid timestamp attribute" do
      cls.new({
        'timestamp' => 'January 19, 2013',
        'uri' => 'http://example.com',
        'share' => true,
        'propagate' => true
      }).to_hash
    end

    assert_raise JSON::Schema::ValidationError, "Missing required uri attribute" do
      cls.new({
        'timestamp' => '1996-12-19T16:39:57-08:00',
        'share' => true,
        'propagate' => true
      }).to_hash
    end

    assert cls.new({
      'timestamp' => '1996-12-19T16:39:57-08:00',
      'uri' => 'http://example.com',
      'propagate' => true
    }).to_hash.has_key?('share')


    assert cls.new({
      'timestamp' => '1996-12-19T16:39:57-08:00',
      'uri' => 'http://example.com',
      'share' => true
    }).to_hash.has_key?('propagate')

    assert_nothing_raised "All required attributes specified" do
      cls.new({
        'timestamp' => '1996-12-19T16:39:57-08:00',
        'uri' => 'http://example.com',
        'share' => true,
        'propagate' => true
      }).to_hash
    end

  end

end
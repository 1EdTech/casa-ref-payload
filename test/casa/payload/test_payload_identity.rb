require 'test/unit'
require 'casa/payload'
require 'json-schema'

class TestPayloadIdentity < Test::Unit::TestCase

  include CASA::Payload

  def test_requirements

    assert_raise JSON::Schema::ValidationError, "Missing required id attribute" do
      PayloadIdentity.new({
        'originator_id' => 'f5b28107-e2c7-46f9-b2fc-34974ede7083'
      }).to_hash
    end

    assert_raise JSON::Schema::ValidationError, "Missing required originator_id attribute" do
      PayloadIdentity.new({
          'id' => 'f5b28107-e2c7-46f9-b2fc-34974ede7083'
      }).to_hash
    end

    assert_nothing_raised "All required attributes specified" do
      PayloadIdentity.new({
        'id' => 'f5b28107-e2c7-46f9-b2fc-34974ede7083',
        'originator_id' => 'f5b28107-e2c7-46f9-b2fc-34974ede7083'
      }).to_hash
    end

  end

end
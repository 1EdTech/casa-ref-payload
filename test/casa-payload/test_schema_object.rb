require 'test/unit'
require 'casa-payload'
require 'hashdiff'

class TestSchemaObject < Test::Unit::TestCase

  include CASA::Payload

  def setup

    @schema = SchemaObject.schema

  end

  def teardown

    SchemaObject.schema! @schema

  end

  def test_class_attribute

    SchemaObject.schema!({ 'title' => 'test' })
    assert SchemaObject.schema['title'] == 'test'
    assert SchemaObject.new.schema['title'] == 'test'

  end

  def test_validation_errors

    SchemaObject.schema!({
      'title' => 'Test',
      'type' => 'object',
      'properties' => {
        'prop' => {
          'type' => 'string',
          'pattern' => '^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$'
        }
      },
      'required' => [
        'prop'
      ]
    })

    object = SchemaObject.new({})

    assert_raise JSON::Schema::ValidationError, "to_hash on invalid object throws validation error" do
      object.to_hash
    end

    assert_raise JSON::Schema::ValidationError, "to_json on invalid object throws validation error" do
      object.to_json
    end

    assert !(object.validates?), "validates? on invalid object returns false"

    assert_nothing_raised "Disable and enable validation" do
      object.disable_validation!
      object.to_hash
      object.enable_validation!
    end

    assert_raise JSON::Schema::ValidationError, "enable_validation! restores validation" do
      object.to_hash
    end

    assert_nothing_raised "Scope out of validation" do
      object.without_validation do
        object.to_hash
      end
    end

  end

end
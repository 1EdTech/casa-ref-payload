require 'test/unit'
require 'casa/payload'
require 'hashdiff'

class TestTransitPayload < Test::Unit::TestCase

  include CASA::Payload

  def test_requirements

    [

        [TransitPayload.schema['properties']['identity'], PayloadIdentity.schema],
        [TransitPayload.schema['properties']['journal'], TransitPayloadJournal.schema],
        [TransitPayload.schema['properties']['original'], TransitPayloadAttributes.schema]

    ].each do |schema|
      assert HashDiff.diff(schema[0],schema[1]).size == 0
    end



  end

end
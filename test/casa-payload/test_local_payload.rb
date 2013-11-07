require 'test/unit'
require 'casa-payload'
require 'hashdiff'

class TestLocalPayload < Test::Unit::TestCase

  include CASA::Payload

  def test_requirements

    [

        [LocalPayload.schema['properties']['identity'], PayloadIdentity.schema],
        [LocalPayload.schema['properties']['attributes'], PayloadLocalAttributes.schema],
        [LocalPayload.schema['properties']['journal'], PayloadLocalJournal.schema],
        [LocalPayload.schema['properties']['original'], PayloadLocalAttributes.schema]

    ].each do |schema|
      assert HashDiff.diff(schema[0],schema[1]).size == 0
    end



  end

end
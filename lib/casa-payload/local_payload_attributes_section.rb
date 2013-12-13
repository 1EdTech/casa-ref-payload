require 'casa-payload/schema_object'

module CASA
  module Payload
    class LocalPayloadAttributesSection < SchemaObject

      self.schema!({
          'type' => 'object',
          'default' => {}
      })

    end
  end
end
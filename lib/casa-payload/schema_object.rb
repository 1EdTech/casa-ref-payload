require 'ostruct'
require 'multi_json'
require 'json-schema'

module CASA
  module Payload
    class SchemaObject < OpenStruct
      
      class << self
    
          attr_reader :schema
          
          def schema! schema
            @schema = schema
          end
        
      end
      
      def initialize hash = nil
        super(hash)
        enable_validation!
      end
      
      def disable_validation!
        @validate = false
      end
      
      def enable_validation!
        @validate = true
      end
      
      def without_validation
        disable_validation!
        yield(self) if block_given?
        enable_validation!
      end
      
      def schema
        self.class.schema
      end
      
      def to_hash
        hash = marshal_dump.inject({}) do |memo,(k,v)|
          if v.respond_to?('to_hash')
            memo[k.to_s] = v.to_hash;
          else
            memo[k.to_s] = v;
          end
          memo
        end
        if @validate
          JSON::Validator.validate! schema, hash, :insert_defaults => true
        end
        hash
      end
      
      def to_json options = nil
         MultiJson.dump to_hash
      end
      
      def validates?
        begin
          to_hash
          true
        rescue JSON::Schema::ValidationError
          false
        end
      end
      
    end
  end
end
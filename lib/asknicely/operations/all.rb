module Asknicely
  module Operations
    module All
      def self.included(klass)
        klass.extend(ClassMethods)
      end

      module ClassMethods
        def all(opts = {}, client = Getfeedback.shared_client)
          opts = Utils.serialize_values(opts)
          json = client.get_json(path, opts)
          @meta = json
          EnumerableResourceCollection.new(array_from_data(json).map { |attributes| new(attributes) }, json)
        end

        def array_from_data(json)
          json.delete(:data)
        end
      end
    end
  end
end

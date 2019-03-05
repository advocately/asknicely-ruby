module Asknicely
  module Operations
    module All
      def self.included(klass)
        klass.extend(ClassMethods)
      end

      module ClassMethods
        def all(params = {}, client = Asknicely.shared_client)
          params = Utils.serialize_values(params)
          json = client.get_json(path, params)
          EnumerableResourceCollection.new(json.map { |attributes| new(attributes) })
        end
      end
    end
  end
end

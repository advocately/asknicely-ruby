module Asknicely
  module Operations
    module Retrieve
      def self.included(klass)
        if klass.singleton_resource?
          klass.extend(Singleton::ClassMethods)
        else
          klass.extend(Pluralton::ClassMethods)
        end
      end

      module Pluralton
        module ClassMethods
          def retrieve(id, opts = {}, client = Getfeedback.shared_client)
            return unless id
            opts = Utils.serialize_values(opts)
            json = client.get_json(path(id), opts)
            json = object_from_data(json)
            new(json)
          end

          def path(id = nil)
            id ? "#{@path}/#{id}" : @path
          end

          def object_from_data(json)
            json
          end
        end
      end

      module Singleton
        module ClassMethods
          def retrieve(opts = {}, client = Asknicely.shared_client)
            opts = Utils.serialize_values(opts)
            json = client.get_json(path, opts)
            new(json)
          end
        end
      end
    end
  end
end

module Asknicely
  class EnumerableResourceCollection < Array
    attr_accessor :meta
    def initialize(collection, meta)
      super(collection)
      @meta = meta
    end
  end
end

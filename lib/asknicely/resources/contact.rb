module Asknicely
  class Contact < Resource
    self.path = "/end_users"
    attr_accessor :meta

    include Operations::All
    include Operations::Retrieve
  end
end

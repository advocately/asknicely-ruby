module Asknicely
  class SurveyResponse < Resource
    self.path = "/responses/desc"
    attr_accessor :meta

    include Operations::Retrieve

    def self.all(params = {}, client = Asknicely.shared_client)
      params = Utils.serialize_values(params)
      path = build_path_from(params)
      json = client.get_json(path, params)
      @meta = json
      EnumerableResourceCollection.new(array_from_data(json).map { |attributes| new(attributes) }, json)
    end

    def self.array_from_data(json)
      json.delete(:data)
    end

  private

    def self.build_path_from(params)
      per_page = params[:per_page] || 100
      page = params[:page] || 1
      since_time = params[:since_date] || 1262304000
      format = 'json'
      filter = params[:status] || 'answered'
      sort_by = params[:sort_by] || 'responded'
      path = ['/responses/desc', per_page, page, since_time, format, filter, sort_by].join("/")
    end
  end
end

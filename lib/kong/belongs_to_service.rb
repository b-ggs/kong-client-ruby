module Kong
  module BelongsToService
    # module ClassMethods
    #   def list(params = {})
    #     1/0
    #   end
    # end

    attr_accessor :service

    def initialize(attributes = {})
      super(attributes)
      use_service_end_point
    end

    # Convert Service end point relative to Kong Service resource
    def use_service_end_point
      self.api_end_point = "/services/#{self.service_id}#{self.class::API_END_POINT}" if self.service_id
    end

    def service_id
      @attributes["service"]["id"] if @attributes["service"]  
    end

    # Get Service resource
    # @return [Kong::Service]
    def service
      @service ||= Service.find(service_id) if service_id
    end

    # Set Service resource
    # @param [Kong::Service] api
    def service=(service)
      @service = service
      self.service_id = service.id
    end

    # Set Service id
    # @param [String] id
    def service_id=(id)
      @attributes["service"]["id"] = id
      use_service_end_point
    end
  end
end

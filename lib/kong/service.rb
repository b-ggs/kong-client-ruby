module Kong
  class Service
    include Base

    ATTRIBUTE_NAMES = %w(
      id name retries protocol host port path connect_tomeout write_timeout read_timeout url service
    ).freeze
    API_END_POINT = '/services/'.freeze

    # @return [Array<Kong::Route>]
    def routes
      Route.list_with_prefix("/services/#{self.id}")
    end
  end
end
module Kong
  class Route
    include Base
    include BelongsToService

    ATTRIBUTE_NAMES = %w(
      id name protocols methods hosts paths regex_priority strip_path
      preserve_host snis sources destinations service service_id
    ).freeze
    API_END_POINT = '/routes/'.freeze
  end
end

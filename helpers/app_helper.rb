# Methods to help
module AppHelper
  # Check if json correct
  # @param json [String] check if json
  # @return [True, False] result
  def valid_json?(json)
    JSON.parse(json)
    true
  rescue JSON::ParserError
    false
  end
end

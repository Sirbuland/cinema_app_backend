class OmdbService
  def initialize(api_key)
    @client = Omdb::Api::Client.new(api_key: api_key)
  end

  def fetch_by_title(title)
    @client.find_by_title(title)
  end
end

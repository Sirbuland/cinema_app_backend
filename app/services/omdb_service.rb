class OmdbService
  def initialize
    @client = Omdb::Api::Client.new(api_key: ENV['OMDB_API_KEY'])
  end

  def fetch_by_title(title)
    @client.find_by_title(title)
  end
end

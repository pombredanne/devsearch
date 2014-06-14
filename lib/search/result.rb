require 'virtus'
module Search
  class Result
    include Virtus.model
    attribute :title, String
    attribute :description, String
    attribute :url, String
    attribute :language, String
    attribute :icon, String
    attribute :author, String
    attribute :type, String

    def color
      
    end

    def self.stash(result)
      ES.save Search::Result.new(result.to_hash)
    end

    def self.search(query)
      ES.search(query)
    end
  end
end

# require 'elasticsearch/persistence'
# repository = Elasticsearch::Persistence::Repository.new
# repository.client = Elasticsearch::Client.new(host: '127.0.0.1:19200')
#
# repository.save Search::Result.new(title: 'Test')

ES = Elasticsearch::Persistence::Repository.new
ES.client = Elasticsearch::Client.new(host: '127.0.0.1:19200')

require 'linguist/language'

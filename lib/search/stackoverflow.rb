module Search
  class Stackoverflow
    URL = "http://api.stackexchange.com/2.2/search/advanced?order=desc&sort=activity&site=stackoverflow&filter=!9YdnSJBlX&q="

    def self.run_query(query)
      JSON.parse(HTTParty.get(URL+URI.escape(query)).body)['items'].map do |item|
        Hashie::Mash.new({
          :title => item['title'],
          :description => item['body'],
          :url => item['link'],
          :language => '',
          :icon => item['owner']['profile_image'],
          :author => item['owner']['display_name'],
          :type => 'stackoverflow'
        })
      end
    end
  end
end

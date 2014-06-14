module Search
  class Issue
    def self.run_query(query)
      Octokit.search_issues(query).items.map do |item|
        Hashie::Mash.new({
          :title => item.full_name,
          :description => item.body,
          :url => item.html_url,
          :language => item.language,
          :icon => item.user.avatar_url,
          :author => item.user.login,
          :type => 'issue'
        })
      end
    end
  end
end

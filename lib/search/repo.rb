module Search
  class Repo
    def self.run_query(query)
      Octokit.search_repositories(query).items.map do |item|
        Hashie::Mash.new({
          :title => item.full_name,
          :description => item.description,
          :url => item.html_url,
          :language => item.language,
          :icon => item.owner.avatar_url,
          :author => item.owner.login,
          :type => 'repo'
        })
      end
    end
  end
end

module Search
  def self.apis
    [Search::Repo, Search::Issue, Search::Stackoverflow]
  end

  def self.parallel_queries(query)
    Parallel.map(apis) do |api|
      api.run_query(query)
    end.flatten
  end

  def self.download(query)
    self.parallel_queries(query).each do |result|
      Search::Result.stash(result)
    end
  end
end

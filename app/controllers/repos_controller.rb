class ReposController < ApplicationController
  require 'faraday_middleware'
  require 'hashie/mash'
  def index
    ## in Faraday 0.8 or above:
    connection = Faraday.new 'https://api.github.com/' do |conn|
      conn.request :json
      conn.response :json, :content_type => /\bjson$/
      conn.use Faraday::Response::Mashify
      conn.adapter Faraday.default_adapter
    end
    response = connection.get 'orgs/ideas2it/repos'
    result =  response.body
    @repos = []
    result.each do |data|
      mashie = Hashie::Mash.new data
      repo = Repo.new
      repo.name = mashie.name
      repo.description = mashie.description
      repo.language = mashie.language
      repo.watchers = mashie.watchers
      @repos << repo
    end
  end
end

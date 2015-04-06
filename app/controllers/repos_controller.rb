class ReposController < ApplicationController
  require 'api_connector'

  def index
    response =  api_connector.get REPO_URL
    @repos = []
    response.body.each do |data|
      repo = Repo.new
      repo.parse data
      @repos << repo
    end
  end

  private
  def api_connector
    ApiConnector.new
  end
end

class Repo
  include ActiveModel::Model
  attr_accessor :name, :description, :language, :watchers

  def parse(data)
    mashie = Hashie::Mash.new data
    self.name = mashie.name
    self.description = mashie.description
    self.language = mashie.language
    self.watchers = mashie.watchers
  end
end

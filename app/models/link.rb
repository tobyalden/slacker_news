class Link < ActiveRecord::Base
  before_save :strip_url
  validates :name, :presence => true
  validates :url, :presence => true
  has_many :comments

  private
  def strip_url
    self.url.sub!(/https\:\/\/www./, '') if self.url.include? "https://www."
    self.url.sub!(/http\:\/\/www./, '')  if self.url.include? "http://www."
    self.url.sub!(/www./, '')            if self.url.include? "www."
    return url
  end

end

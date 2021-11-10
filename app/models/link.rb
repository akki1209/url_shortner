class Link < ActiveRecord::Base
  validates_presence_of :original_url
  validates :original_url, format: URI::regexp(%w[http https])
  validates_presence_of :sluged_url
  validates :sluged_url, format: URI::regexp(%w[http https])

  validates_uniqueness_of :url_slug

  def short
    Rails.application.routes.url_helpers.short_url(slug: self.url_slug)
  end
end

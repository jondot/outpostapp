class Location < ActiveRecord::Base
  belongs_to :outpost
  has_many :uploads, :order=>'created_at DESC'

  validates_presence_of :path

  def create_upload!(filename)
    uploads.create! :file => File.expand_path(filename)
  end

  def to_s
    path
  end
end

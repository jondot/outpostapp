require 'simple_uuid'
include SimpleUUID

class Outpost < ActiveRecord::Base
  has_many :locations, :order=>'created_at DESC'
  belongs_to :user
  validates_presence_of :nid, :base_location
  validates_uniqueness_of :uuid
  validates_format_of :base_location, :with=>/^[a-zA-Z0-9_-]{1,128}$/
  after_initialize :defaults


  #
  # callbacks
  #
  before_create :build_default_location
  
  def build_default_location
    locations.build(:path=> "public/system/#{nid}/#{base_location}/#{uniq_id}")
  end
  
  def location
    locations.first
  end
  
  def create_upload!(file)
    roll! if should_roll?
    location.create_upload!(file)
  end
  
  def to_param
    "#{id}-#{nid}"
  end
  
  def verifies_size(sz)
    return size_limit == 0 || sz < size_limit * 1000 #kb
  end
  
  def should_roll?
    return false if self.rolling == 0
    
    piggyback = DateTime.now - self.rolling / 24.0
    location.created_at < piggyback    
  end
  
  def roll!
    raise 'precondition not met: should not roll' unless should_roll?
    
    build_default_location
    save!
  end
  
private
  def defaults
    self.nid ||= uniq_id
    self.base_location ||= "uploads_#{nid}"
    self.uuid ||= ::UUID.new.to_guid.gsub '-', ''
  end

  def uniq_id
    Time.now.to_i.to_s
  end
end

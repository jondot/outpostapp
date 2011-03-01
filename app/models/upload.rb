require 'utils/checksum'
require 'simple_uuid'
include SimpleUUID

class Upload < ActiveRecord::Base
  belongs_to :location
  validates_presence_of :file

  before_create :generate_uuid
  after_create :queue_calculate_checksum, 
               :queue_upload_accepted_notification
            
  def to_s
    File.basename(file)
  end
  
private
  def generate_uuid
    self.uuid = UUID.new.to_guid.gsub '-', ''
  end

  def queue_upload_accepted_notification
    #todo: replace hardcoded mail with current_user.email.
    outpost = location.outpost
    return unless outpost.notification
    
    Notifier.delay.upload_accepted({:to=>'dipidi@gmail.com', :upload=>self.to_s, :outpost=>outpost.nid})
  end

  def queue_calculate_checksum
    self.delay.calculate_checksum!
  end
  
  def calculate_checksum!
    self.checksum = Checksum::sha_file(self.file)
    self.save!    
  end
end

class Notifier < ActionMailer::Base
  default :from => "outpostapp@gmail.com"
  
  
  def upload_accepted(opts)
    @opts = opts
    mail(:to => @opts[:to], :subject=>'[Outpost] A new upload has been made')
  end
end

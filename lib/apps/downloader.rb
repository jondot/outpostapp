# http://groups.google.com/group/thin-ruby/browse_thread/thread/4762f8f851b965f6
require 'sinatra-xsendfile'

class DownloaderApp < Sinatra::Application
  set :views, File.join(File.dirname(__FILE__), 'views')
  
  get '/:uuid' do
    u = Upload.find_by_uuid(params[:uuid])
    halt 404 if u.nil?
    send_file u.file, :filename=>File.basename(u.file)
  end
  
end
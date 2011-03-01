# upload with:
# curl -v -F "data=@/path/to/filename" http://localhost:4567/user/filename


class UploaderApp < Sinatra::Application
  set :views, File.join(File.dirname(__FILE__), 'views')
  get '/:name' do
    erb :submit
  end

  post '/:name' do
    op = Outpost.find_by_nid(params[:name])
    halt 404 if op.nil?
    
    datafile = params[:data]
    halt 404 if datafile.nil?
    halt 413 unless op.verifies_size datafile[:tempfile].size
    
    location = op.location
    dir = location.path
    FileUtils.mkdir_p(dir)
    filename = File.join dir, datafile[:filename]

    File.open(filename, 'wb') do |file|
      file.write(datafile[:tempfile].read)
    end
    
    op.create_upload! filename
    
    'ok'
  end
end

require "digest"
 
module Checksum
  def self.sha_file(file)
    digest = Digest::SHA1.new
    File.open(file, "r") do |f|
      digest.update f.read(8192) until f.eof
    end
    digest.hexdigest
  end
end
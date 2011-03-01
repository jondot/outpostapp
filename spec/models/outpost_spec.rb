require 'spec_helper'

describe Outpost do
  
  it "should have defaults when initialized." do
    o = Outpost.new
    o.nid.should_not be_empty
    o.base_location.should_not be_empty
  end
  
  it "should auto assign a location after creation" do
    t = Time.now
    Timecop.freeze(t) do
      o = Outpost.new
      o.save
      o.location.should_not be_nil
      o.location.path.should == "public/system/#{o.nid}/#{o.base_location}/#{t.to_i}"
    end
  end
  
  it "should never roll if not configured to roll" do
    o = Outpost.new
    o.rolling = 0
    o.should_roll?.should be_false
    Timecop.freeze(Time.utc(Time.now.year + 1,1,1)) do
      o.should_roll?.should be_false      
    end
  end

  it "should not roll if within non-roll window" do
    o = Outpost.new
    o.save
    o.rolling = 8 #hours
    o.should_roll?.should be_false
    Timecop.freeze(Time.now + 4*60*60) do
      o.should_roll?.should be_false
    end
  end

  it "should roll if out of non-roll window" do
    o = Outpost.new
    o.save!
    o.rolling = 8 #hours
    o.should_roll?.should be_false
    Timecop.freeze(Time.now + 9*60*60) do
      o.should_roll?.should be_true      
    end
  end
  
  it "should roll the location and create a new one" do
    o = Outpost.new
    o.save
    o.rolling = 8 #hours
    o.should_roll?.should be_false
    Timecop.freeze(Time.now + 9*60*60) do
      old_id = o.location.id
      o.roll!
      o.reload
      o.locations.count.should == 2
      old_id.should_not == o.location.id
    end
  end
  
  it "should auto-roll when creating upload" do
    o = Outpost.new
    o.save
    o.rolling = 8 #hours
    o.should_roll?.should be_false
    Timecop.freeze(Time.now + 9*60*60) do
      old_id = o.location.id
      o.create_upload! 'foo'
      o.reload
      old_id.should_not == o.location.id
    end
  end

  it "should not auto-roll when creating upload" do
    o = Outpost.new
    o.save
    o.rolling = 8 #hours
    o.should_roll?.should be_false
    Timecop.freeze(Time.now + 2*60*60) do
      old_id = o.location.id
      o.create_upload! 'foo'
      old_id.should == o.location.id
    end
  end

  it "should verify size" do
    o = Outpost.new
    o.size_limit = 90 #kb
    o.verifies_size(20_000).should be_true
    o.verifies_size(200_000).should be_false
    o.size_limit = 0
    o.verifies_size(2000).should be_true
    o.verifies_size(200_000).should be_true
  end
  
  it "should create upload" do
    o = Outpost.new
    o.save
    o.create_upload!("foo")
    o.reload
    o.location.uploads.first.file.end_with?('foo').should be_true
  end
end

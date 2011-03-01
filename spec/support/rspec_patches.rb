RSpec::Rails::Mocks.module_eval do
  
  # Creates a mock object instance for a +model_class+ with common
  # methods stubbed out. Additional methods may be easily stubbed (via
  # add_stubs) if +stubs+ is passed.
  def mock_model(model_class, options_and_stubs = {})
    m = model_class.new
    id = next_id
    
    # our equivalent to Rspecs :errors => ''# stub("errors", :count => 0)
    stub(errors_stub = Object.new).count{0}
    
    options_and_stubs.reverse_merge!({
      :id => id,
      :to_param => "#{id}",
      :new_record? => false,
      :errors => errors_stub
      })
    
      options_and_stubs.each do |method,value|
        eval "stub(m).#{method}{value}"
      end
  
      yield m if block_given?
      m
  end
  
end

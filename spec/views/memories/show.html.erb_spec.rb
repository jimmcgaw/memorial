require 'spec_helper'

describe "memories/show.html.erb" do
  before(:each) do
    @memory = assign(:memory, stub_model(Memory))
  end

  it "renders attributes in <p>" do
    render
  end
end

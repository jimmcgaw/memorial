require 'spec_helper'

describe "memories/show.html.erb" do
  before(:each) do
    @memory = assign(:memory, stub_model(Memory,
      :first_name => "First Name",
      :middle_name => "Middle Name",
      :last_name => "Last Name",
      :epitaph => "Epitaph",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Middle Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Last Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Epitaph/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end

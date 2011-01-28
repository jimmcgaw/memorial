require 'spec_helper'

describe "memories/index.html.erb" do
  before(:each) do
    assign(:memories, [
      stub_model(Memory,
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :epitaph => "Epitaph",
        :description => "MyText"
      ),
      stub_model(Memory,
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :epitaph => "Epitaph",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of memories" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Epitaph".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

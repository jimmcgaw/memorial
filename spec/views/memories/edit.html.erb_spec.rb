require 'spec_helper'

describe "memories/edit.html.erb" do
  before(:each) do
    @memory = assign(:memory, stub_model(Memory,
      :new_record? => false,
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :epitaph => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit memory form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => memory_path(@memory), :method => "post" do
      assert_select "input#memory_first_name", :name => "memory[first_name]"
      assert_select "input#memory_middle_name", :name => "memory[middle_name]"
      assert_select "input#memory_last_name", :name => "memory[last_name]"
      assert_select "input#memory_epitaph", :name => "memory[epitaph]"
      assert_select "textarea#memory_description", :name => "memory[description]"
    end
  end
end

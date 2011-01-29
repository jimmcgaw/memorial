require 'spec_helper'

describe "funerals/new.html.erb" do
  before(:each) do
    assign(:funeral, stub_model(Funeral,
      :where => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :postal_code => "MyString",
      :phone_number => "MyString",
      :instructions => "MyText",
      :memory_id => 1
    ).as_new_record)
  end

  it "renders new funeral form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => funerals_path, :method => "post" do
      assert_select "input#funeral_where", :name => "funeral[where]"
      assert_select "input#funeral_address1", :name => "funeral[address1]"
      assert_select "input#funeral_address2", :name => "funeral[address2]"
      assert_select "input#funeral_city", :name => "funeral[city]"
      assert_select "input#funeral_state", :name => "funeral[state]"
      assert_select "input#funeral_postal_code", :name => "funeral[postal_code]"
      assert_select "input#funeral_phone_number", :name => "funeral[phone_number]"
      assert_select "textarea#funeral_instructions", :name => "funeral[instructions]"
      assert_select "input#funeral_memory_id", :name => "funeral[memory_id]"
    end
  end
end

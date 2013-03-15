require 'spec_helper'

describe "questions/new.html.erb" do
  before { assign(:question, Question.new) }
  
  it "should include a text: 'New Question'" do
    render
    rendered.should include("New Question")
  end

  describe "creating new question" do   
    it "should display a form with one text field one text area and one submit button" do
      render
      assert_select "form" do
        assert_select "input[name=?]", "question[title]"
        assert_select "textarea[name=?]", "question[body]"
        assert_select "input[type=?]", "submit"
      end
    end
  end

end
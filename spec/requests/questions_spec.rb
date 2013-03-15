require 'spec_helper'

describe "Questions" do
  describe "GET /questions" do
    it "Should respond with success to /quetsions" do
      get questions_path
      response.status.should be(200)
    end
  end


end
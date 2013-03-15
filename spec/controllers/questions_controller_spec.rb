require 'spec_helper'

describe QuestionsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "Creating new question" do
    it "should display a page for creating new question" do
      get 'new'
      response.should be_success
    end

    it "should respond to a post request to create a question" do
      post 'create'
      response.should be_success
    end

    it "should create new record in database with valid paramters" do
      valid_parameters = {question: { title: "my first title", body: "my first question body"}}
      expect{ post("create", valid_parameters)}.to change {Question.count}.by(1)
    end

    it "should redirect to the question show page" do
      valid_parameters = {question: { title: "my first title", body: "my first question body"}}
      post("create", valid_parameters)
      question = Question.where(title: "my first title").first
      response.should redirect_to(question_path(question))
    end

    context "with invalid parameters" do
      let(:invalid_params) {  {question: {title: "", body: ""}} }

      it "Should not create a new record in the database with invlaid parameters" do
        expect{post "create", invalid_params}.to_not change {Question.count}
      end

      it "Should render the new template again" do
        post "create", invalid_params
        response.should render_template(:new)
      end
    end


    describe "Updating a question" do
      let(:question) { Question.create(title: "Some title", body: "some body") }

      context "Showing the edit page for the question" do

        it "should fetch the question with the id that we pass" do
          get "edit", {id: question.id}
          assigns(:question).should eq(question)
        end
      end

      context "calling update on a question" do
        context "with valid parameters" do
          let(:valid_params) {{question: {title:"New Title", body: "New Body"}}}

          before { put "update", valid_params.merge({id: question.id}) }

          it "should update existing body attribute in the database" do
            Question.find(question.id).body.should == valid_params[:question][:body]
          end

          it "should update existing title attribute in the database" do
            Question.find(question.id).title.should == valid_params[:question][:title]
          end

          it "should redirect to the question show page" do            
            response.should redirect_to(question_path(question))
          end
        end

        context "with invalid parameters" do
          let(:invalid_params) {{question: {title:"", body: "New Body"}}}

          before { put "update", invalid_params.merge({id: question.id}) }

          it "Should NOT change the title of the question" do
            Question.find(question.id).title.should_not be_empty
          end

          it "Should NOT change the body of the question" do
            Question.find(question.id).body.should_not ==  "New Body"
          end

          it "should render the edit template on failure" do
            response.should render_template(:edit)
          end

        end
      end
    end

    describe "Destroying a question" do
      let(:question) { Question.create(title: "Hello World!", body: "Hello Workshop!") }

      it "Should not find the question in the database" do
        delete "destroy", id: question.id
        Question.find_by_id(question.id).should be_nil
      end

      it "Should redirect to index page if it succeeds" do
        delete "destroy", id: question.id
        response.should redirect_to(questions_path)
      end      
    end
  end

end

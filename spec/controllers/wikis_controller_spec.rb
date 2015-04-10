require 'rails_helper'

RSpec.describe WikisController, type: :controller do

  describe "View displays all wikis" do
    it "should show all the wikis in the database" do
      @wiki = Wiki.create(title: "Lorem ipsum dolor", body:"Aenean enim dui, commodo fringilla gravida eget, consectetur a tellus.")
      get :index
      #expect(response).to have_content @wiki.title
      expect(assigns(:wikis)).to match_array(Wiki.all)
    end
  end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end

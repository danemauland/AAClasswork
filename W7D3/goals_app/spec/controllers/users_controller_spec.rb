require "rails_helper"

RSpec.describe UsersController, type: :controller do
    describe "GET #show" do
        it "should render the show template if the user exists" do
            user = FactoryBot.create(:user)
            get :show, params: {id: user.id}
            expect(response).to render_template(:show)
            expect(response).to be_success
        end

        it "shouldn't render the show template if the user does not exist" do
            begin
                get :show, params: {id: -1}
            rescue
                ActiveRecord::RecordNotFound
            end
            expect(response).not_to render_template(:show)
        end
    end

    describe "GET #new" do
        it "should render the new template" do
            get :new
            expect(response).to render_template(:new)
            expect(response).to be_success
        end
    end

    describe "POST #create" do
        context "when passed valid account info" do
            it "should redirect to the show page" do
                post :create, params: { user: { username: "something",
                                                password: "password123" } }
                expect(response).to redirect_to(user_url(User.find_by(username: "something")))
            end
        end

        context "when passed a duplicate username" do
            it "should render new with the errors" do
                post :create, params: { user: { username: "something",
                                                password: "password123" } }
                post :create, params: { user: { username: "something",
                                                password: "password123" } }
                expect(response).to render_template(:new)
            end
        end

        context "when passed an invalid password" do
            it "should render new with the errors" do
                post :create, params: { user: { username: "something",
                                                password: "pass" } }
                expect(response).to render_template(:new)
            end
        end
    end
end
# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_length_of(:password).is_at_least(6) }

    subject(:user) { FactoryBot.build(:user) }

    describe "User::find_by_credentials" do
        context "when passed valid credentials" do
            it "should return the correct user" do
                user = FactoryBot.create(:user)
                expect(User.find_by_credentials(user.username, "password123")).to eq(user)
            end
        end

        context "when passed invalid username" do
            it "should return nil" do
                user = FactoryBot.create(:user)
                expect(User.find_by_credentials("hjrgbihldzg", user.password)).to be_nil
            end
        end

        context "when passed invalid password" do
            it "should return nil" do
                user = FactoryBot.create(:user)
                expect(User.find_by_credentials(user.username, "PASSWORD124")).to be_nil
            end
        end
    end

    describe "User#is_password?" do
        context "When passed a valid password" do
            it "should return true" do
                expect(user.is_password?("password123")).to be true
            end
        end

        context "When passed an invalid password" do
            it "should return false" do
                expect(user.is_password?("password124")).to be false
            end
        end
    end

    describe "User#reset_session_token!" do
        it "should return the new session token" do
            expect(user.reset_session_token!).to eq(user.session_token)
        end
        it "should set a new session token" do
            old_session_token = user.session_token
            user.reset_session_token!
            expect(user.session_token)    
        end
        it 'should save the new session ID to the database' do
            user = FactoryBot.create(:user)
            ses_token = user.reset_session_token!
            user = User.find_by(username: user.username)
            expect(ses_token).to eq(user.session_token)
        end
    end
end
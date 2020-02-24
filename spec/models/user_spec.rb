require 'rails_helper'
describe User do
  describe '#create' do
    context 'can save' do

      it "is valid with a password that has more than 8 characters" do
        user = build(:user, password: "00000000")
        user.valid?
        expect(user).to be_valid
      end

      it "is valid without a fav_spot" do
        user = build(:user, fav_spot: "")
        user.valid?
        expect(user).to be_valid
      end

      it "is valid without a sns_hp" do
        user = build(:user, sns_hp: "")
        user.valid?
        expect(user).to be_valid
      end

    end

    context 'can not save' do


      it "is invalid without a username" do
        user = build(:user, username: "")
        user.valid?
        expect(user.errors[:username]).to include("can't be blank")
      end

      it "is invalid with a duplicate username" do
        user = create(:user)
        another_user = build(:user, username: user.username)
        another_user.valid?
        expect(another_user.errors[:username]).to include("has already been taken")
      end


      it "is invalid without an email" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "is invalid without a password" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "is invalid with a password that has less than 7 characters" do
        user = build(:user, password: "0000000")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
      end

      it "is invalid without a password_confirmation although with a password" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it "is invalid without a fav_country" do
        user = build(:user, fav_country: "")
        user.valid?
        expect(user.errors[:fav_country]).to include("can't be blank")
      end

      it "is invalid without an introduction" do
        user = build(:user, introduction: "")
        user.valid?
        expect(user.errors[:introduction]).to include("can't be blank")
      end

    end
  end
end
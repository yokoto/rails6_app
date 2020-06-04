require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    describe 'name' do
      context 'presence: true' do
        let(:user) { build(:user, name: '') }
        it {
          user.valid?
          expect(user.errors.messages[:name]).to include('を入力してください')
        }
      end

      context 'length: { maximum: 30 }' do
        let(:user) { build(:user, name: 'a' * 31) }
        it {
          user.valid?
          expect(user.errors.messages[:name]).to include('は30文字以内で入力してください')
        }
      end
    end

    describe 'email' do
      context 'presence: true' do
        let(:user) { build(:user, email: '') }
        it {
          user.valid?
          expect(user.errors.messages[:email]).to include('を入力してください')
        }
      end

      context 'length: { maximum: 100 }' do
        let(:user) { build(:user, email: 'a' * 90 + '@sample.com') }
        it {
          user.valid?
          expect(user.errors.messages[:email]).to include('は100文字以内で入力してください')
        }
      end

      context 'uniqueness: { case_sensitive: false }' do
        before { create(:user) }
        let(:user) { build(:user, email: 'SAMPLE@sample.com') }
        it {
          user.valid?
          expect(user.errors.messages[:email]).to include('はすでに存在します')
        }
      end
    end

    describe 'EmailValidator' do
      context 'format' do
        let(:user) { build(:user, email: 'invalid_email_format') }
        it {
          user.valid?
          expect(user.errors.messages[:email]).to include('は正しい形式で入力してください')
        }
      end
    end

    describe 'password' do
      context 'presence: true' do
        let(:user) { build(:user, password: '') }
        it {
          user.valid?
          expect(user.errors.messages[:password]).to include('を入力してください')
        }
      end
    end
  end
end

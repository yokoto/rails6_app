# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'テストユーザー' }
    email { 'sample@sample.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end

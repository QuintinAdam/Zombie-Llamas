# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_event do
    game nil
    decription "MyText"
    negative "MyString"
    positive "MyString"
    effect "MyString"
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_llama do
    user nil
    name "MyString"
    decription "MyText"
    power 1
    power_bonus 1
    defence 1
    defence_bonus 1
    luck 1
    order 1
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_basis, :class => 'UserBase' do
    user nil
    name "MyString"
    decription "MyText"
    defence 1
    defence_bonus 1
    luck 1
    order 1
  end
end

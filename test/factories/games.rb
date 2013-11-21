# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    user nil
    points 1
    gold 1
    population 1
  end
end

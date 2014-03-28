# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :social do
    social_network "MyString"
    username "MyString"
    url "MyString"
  end
end

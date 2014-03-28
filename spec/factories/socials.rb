FactoryGirl.define do
  factory :social do
    network 'Twitter'
    username 'holoteca'
    url 'http://twitter.com/holoteca'
    user
  end
end

FactoryGirl.define do
  factory :user do
    name 'Holoteca Bar'
    email 'contato@holoteca.com.br'
    password 'senha'
    role 'admin'
    about 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
    permalink 'holoteca-bar'
    twitter 'http://twitter.com/holoteca'
    facebook 'http://facebook.com/holoteca'
    site 'http://holoteca.com.br'
  end
end
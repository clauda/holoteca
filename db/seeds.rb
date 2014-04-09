User.create(
  name: 'Claudia Farias',
  email: 'krawdyah@gmail.com',
  password: 'senha',
  password_confirmation: 'senha',
  role: 'admin')

User.create(
  name: 'Lívia Stockler',
  email: 'livia@holoteca.com.br',
  password: 'senha',
  password_confirmation: 'senha',
  role: 'admin')

%w(Viagem Tecnologia Entretenimento Saúde Arte).each { |category| Category.create name: category }

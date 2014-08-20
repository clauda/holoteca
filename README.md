## Holoteca

[![wercker status](https://app.wercker.com/status/8ef3efb0eed1f5fed88add0d6e7d0dbf/m/ "wercker status")](https://app.wercker.com/project/bykey/8ef3efb0eed1f5fed88add0d6e7d0dbf)

* Ruby 2.1.1
* Rails 4.1
* Mongoid 4.0.0.beta1
* Rspec

### Setup

Dependecies rmagick, libpng, pngquant, jpegoptim, optpng.

Some environment variables.


```
 bundle install
 rake db:setup
 foreman start
```

### Staging

On heroku staging.holoteca.com.br

```
git remote add staging git@heroku.com:holoteca.git
git push staging master
```


### Production

Hosted on DigitalOcean

```
cap production deploy
```

#### Troubleshooting

Unicorn start

```
bundle exec unicorn -c config/unicorn.rb -D
```



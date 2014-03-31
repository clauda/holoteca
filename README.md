## Holoteca

[![wercker status](https://app.wercker.com/status/8ef3efb0eed1f5fed88add0d6e7d0dbf/m/ "wercker status")](https://app.wercker.com/project/bykey/8ef3efb0eed1f5fed88add0d6e7d0dbf)

* Ruby 2.1.1
* Rails 4.0.4
* Mongoid 4.0.0.alpha1
* Rspec

### Setup

Dependecies rmagikc, libpng, pngquant, jpegoptim, optpng.

Some environment variables.


```
 cp config/mongoid.yml.sample config/mongoid.yml
 bundle install
 rake db:setup
 foreman start

```

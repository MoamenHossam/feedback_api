# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.3.1

* Rails version 5.2

* System dependencies

* Configuration

* Database creation #mysql database "feedbacks"

* there an issue using memory caching in rails 5.2,
  the cache_key is no longer consisting of the object id + updated_at,
  the cache_key now consist of just the object name + id ex: "feedback/15"
  so the memory caching not working quite right.

* sidekiq, Elasticsearch included.

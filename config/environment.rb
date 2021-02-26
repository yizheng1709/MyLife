require 'bundler/setup'
Bundler.require(:default)

require_all 'app'

set(:database, {adapter: "sqlite3", database: "db/mylife.sqlite3"})


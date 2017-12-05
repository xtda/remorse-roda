require_relative 'db'


Sequel::Model.cache_associations = false if App.development?
Sequel::Model.plugin(:json_serializer)

Unreloader.require('models'){|f| Sequel::Model.send(:camelize, File.basename(f).sub(/\.rb\z/, ''))}
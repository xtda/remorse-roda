class App < Roda
  plugin :environments
  plugin :multi_route
  plugin :json

  Unreloader.require('./app/controllers') {}

  route do |r|
    response['Content-Type'] = 'application/json'

    r.multi_route

    r.root do
      'It works!'
    end
  end
end
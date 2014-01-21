express = require 'express'

module.exports = (app, vent) ->
  port = app.config.port  || 3000
  app.set 'showStackError', true

  app.set 'port', port
  app.use express.logger('dev')
  app.use express.json()
  app.use express.urlencoded()
  app.use express.methodOverride()
  app.use express.static("#{app.config.root}/public")

  if app.env is 'development'
    app.use express.errorHandler
      dumpExceptions: true
      showStack: true
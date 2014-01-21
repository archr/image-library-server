express = require 'express'
require 'coffee-script'
fs = require 'fs'

env = process.env.NODE_ENV or 'development'
config = require('./conf/conf')[env]
modelsPath = __dirname + '/app/models'

app = express()
app.env = env
app.config = config
app.models = {}

mongoose = require 'mongoose'
mongoose.connect config.db

require('./conf/express')(app)
require('./conf/express-web')(app)

fs.readdirSync(modelsPath).forEach (file) ->
  model = require(modelsPath + '/' + file)()
  app.models[model.modelName] = model if model.modelName

modules = ['main']
for module in modules
	require("./app/#{module}")(app)

app.listen app.config.port
console.log "app runing in port #{app.config.port}"
module.exports = app


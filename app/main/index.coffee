module.exports = (app) ->

	main = require('./routes/main')(app)
	app.use('/', main.middleware)

	return
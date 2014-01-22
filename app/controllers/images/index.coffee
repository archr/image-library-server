module.exports = (app) ->

	api = require('./routes/api')(app)
	app.use('/api/images', api.middleware)

	return
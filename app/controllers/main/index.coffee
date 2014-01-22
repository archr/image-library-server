module.exports = (app) ->
	web = require('./routes/web')(app)
	app.use('/', web.middleware)

	return

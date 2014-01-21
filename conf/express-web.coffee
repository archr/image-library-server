module.exports = (app) ->
	app.set 'views', "#{app.config.root}/app/views"
	app.set 'view engine', 'jade'

	return 
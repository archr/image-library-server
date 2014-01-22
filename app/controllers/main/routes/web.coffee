express = require 'express'

module.exports = (app) ->
	router = new express.Router()

	router.get '/'
	, (req, res) ->
		res.render 'main/index'

	router
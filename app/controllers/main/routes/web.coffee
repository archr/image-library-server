express = require 'express'

module.exports = (app) ->
  router = new express.Router()
  dirname = app.config.root

  router.get '/'
  , (req, res) ->
    res.render 'main/index'

  router.get '/download'
  , (req, res)->
    file = "#{dirname}/public/static/image-library-0.2.crx"
    res.download file, 'image-library-0.2.crx'


  router
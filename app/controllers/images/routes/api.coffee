express = require 'express'

module.exports = (app) ->
  router = new express.Router()

  Image = app.models.Image

  router.get '/'
  , (req, res) ->
    Image.find {}, null, {sort: {'createdAt': -1}}
    , (err, images) ->
      if err 
        return res.json success: false
      res.json
        success: true
        images: images

  router.post '/'
  , (req,res) ->
    unless req.body.srcUrl
      return res.json success: false
    new Image(req.body).save (err, image) ->
      if err
        console.log err
        return res.json success: false
      res.json
        success: true
      

  router


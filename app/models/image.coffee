mongoose = require 'mongoose'
Schema = mongoose.Schema
troop = require 'mongoose-troop'

module.exports = ->
  imageSchema = new Schema
    srcUrl: {type:String, required:true}

  imageSchema.plugin troop.timestamp,
    { createdPath: 'createdAt', useVirtual: false }

  mongoose.model 'Image', imageSchema

path = require "path"
rootPath = path.normalize(__dirname + '/..')

exports.development =
  port: process.env.PORT or 4000
  db: 'mongodb://localhost/si_dev'
  root: rootPath
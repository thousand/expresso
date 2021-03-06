path = require 'path'
express = require 'express'
stylus = require 'stylus'
assets = require 'connect-asset'
jadeBrowser = require 'jadebrowser'
session = require 'express-session'
cookieParser = require 'cookie-parser'
bodyParser = require "body-parser"

#### Basic application initialization
# Create app instance.
app = express()

# Define Port & Environment
app.port = process.env.PORT or process.env.VMC_APP_PORT or 3000
env = process.env.NODE_ENV or "development"

# Config module exports has `setEnvironment` function that
# sets app settings depending on environment
config = require "./config"
config.setEnvironment env

if env != 'production'
  require('express-livereload')(app, {exts:['styl']})
else
  console.log('If you are running in production, you may want to modify the mongoose connect path')

#### View initializations
# Add Connect Assets.
app.use assets()
# Set the public folder as static assets.
app.use express.static(process.cwd() + '/public')
app.use jadeBrowser('/js/lib/templates.js', '**', { root: path.join __dirname, 'assets/tmpl' })

# Express Session
console.log "setting session/cookie"
app.use cookieParser()
app.use session(
  secret: "much session"
  key: "wow"
  cookie:
    secure: true
)

# Set View Engine.
app.set 'view engine', 'jade'

# [Body parser middleware](http://www.senchalabs.org/connect/middleware-bodyParser.html)
# parses JSON or XML bodies into `req.body` object
app.use bodyParser()


#### Finalization
# Initialize routes
routes = require './routes'
routes(app)


# Export application object
module.exports = app

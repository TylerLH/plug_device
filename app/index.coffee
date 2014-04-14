express = require 'express'
app     = express()
io      = require('socket.io-client')
socket  = io.connect('http://localhost:3000')
rasp2c  = require 'rasp2c'

rasp2c.detect (err, result) ->
  if err
    console.log err
  else
    console.log result

socket.on 'connect', ->
  socket.on 'welcome', (data) ->
    console.log data

app.listen(3001)
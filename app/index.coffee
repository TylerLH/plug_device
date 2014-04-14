express = require 'express'
app     = express()
io      = require('socket.io-client')
socket  = io.connect('http://localhost:3000')
rasp2c  = require 'rasp2c'

socket.on 'connect', ->
  socket.on 'welcome', (data) ->
    console.log data

process.nextTick ->
  rasp2c.detect (err, devices) ->
    if err?
      console.log err
    else
      console.log devices

app.listen(3001)
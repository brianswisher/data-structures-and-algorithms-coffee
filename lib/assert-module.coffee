require 'coffee-script/register'
colors = require 'colors'
assertModule = require '../lib/assert'

assertModule.assert.print = (data) ->
    if data.invert
        console.log "#{data.label}"["#{assertModule.assert[data.state]}"].inverse
    else
        console.log "#{data.label}"["#{assertModule.assert[data.state]}"]

exports.assertModule = assertModule
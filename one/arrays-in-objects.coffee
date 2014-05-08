require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test 'Arrays in objects', ->
    validate.assert null, '-----------------'

(fn = ->
    class WeekTemps
        constructor: (@dataStore = []) ->
        add: (temp) ->
            @dataStore.push temp
        average: ->
            total = 0
            for item in @dataStore by 1
                total += item
            total / @dataStore.length

    thisWeek = null

    validate.assert.test 'WeekTemps class w/ dataStore', ->
        validate.assert (->
            thisWeek = new WeekTemps()
            thisWeek.add 52
            thisWeek.average() is 52
        )(), "average: #{thisWeek.average()}"
        validate.assert (->
            thisWeek.add 61
            thisWeek.average() is 56.5
        )(), "average: #{thisWeek.average()}"
        validate.assert (->
            thisWeek.add 65
            thisWeek.average() is 59.333333333333336
        )(), "average: #{thisWeek.average()}"
        validate.assert (->
            thisWeek.add 55
            thisWeek.average() is 58.25
        )(), "average: #{thisWeek.average()}"
        validate.assert (->
            thisWeek.add 55
            thisWeek.average() is 57.6
        )(), "average: #{thisWeek.average()}"
        validate.assert (->
            thisWeek.add 50
            thisWeek.average() is 56.333333333333336
        )(), "average: #{thisWeek.average()}"
        validate.assert (->
            thisWeek.add 52
            thisWeek.average() is 55.714285714285715
        )(), "average: #{thisWeek.average()}"
        validate.assert (->
            thisWeek.add 49
            thisWeek.average() is 54.875
        )(), "average: #{thisWeek.average()}"
)()
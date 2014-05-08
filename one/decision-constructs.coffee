require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test "Decision Constructs", ->
    validate.assert null, "-------------------"

(fn = ->
    monthNum = process.argv[2] or '12'
    switch monthNum
        when '1' then monthName = 'January'
        when '2' then monthName = 'February'
        when '3' then monthName = 'March'
        when '4' then monthName = 'April'
        when '5' then monthName = 'May'
        when '6' then monthName = 'June'
        when '7' then monthName = 'July'
        when '8' then monthName = 'August'
        when '9' then monthName = 'September'
        when '10' then monthName = 'October'
        when '11' then monthName = 'November'
        when '12' then monthName = 'December'

    expect = 'December'
    validate.assert.test 'The switch statement', ->
        validate.assert monthName is expect, "monthName equals '#{expect}'\n"
)()

(fn = ->
    mid = 25
    high = 50
    low = 1
    current = process.argv[2] or 13
    found = -1
    if current < mid
        mid = (current - low) / 2
    else if current > mid
        mid = (current + high) / 2
    else
        found = current

    expect = [
        6
        -1
    ]
    expect1 = -1
    validate.assert.test 'The if-else if statement', ->
        validate.assert mid is expect[0], "mid equals #{expect[0]}"
        validate.assert found is expect[1], "found equals #{expect[1]}"
)()

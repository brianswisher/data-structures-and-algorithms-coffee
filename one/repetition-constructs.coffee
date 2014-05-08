require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test "Repetition Constructs", ->
    validate.assert null, "---------------------"

(fn = ->
    number = 0
    sum = 0
    while ++number < 11
        sum += number

    expect = 55
    validate.assert.test 'The while loop', ->
        validate.assert sum is expect, "sum equals #{expect}\n"
)()

(fn = ->
    number = 1
    sum = 0
    for number in [1..10] by 1
        sum += number

    expect = 55
    validate.assert.test 'Summing integrers using a for loop', ->
        validate.assert sum is expect, "sum equals #{expect}\n"
)()

(fn = ->
    numbers = [
        3
        7
        12
        22
        100
    ]
    sum = 0

    for i in numbers by 1
        sum += i

    expect = 144
    validate.assert.test 'Using a for loop w/ an array', ->
        validate.assert sum is expect, "sum equals #{expect}"
)()

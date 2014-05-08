require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test "Accessing and Writing Array Elements", ->
    validate.assert null, "------------------------------------"

(fn = ->
    nums = []
    for i in [0..99] by 1
        nums[i] = i+1

    expect = 100
    validate.assert.test 'Write array items using []', ->
        validate.assert nums.length is expect, "nums array has #{expect} items"
)()

(fn = ->
    numbers = [
        1
        2
        3
        4
        5
    ]
    sum = numbers[0] + numbers[1] + numbers[2] + numbers[3] + numbers[4]

    expect = 15
    validate.assert.test 'Access array items using []', ->
        validate.assert sum is expect, "sum equals #{expect}"
)()

(fn = ->
    numbers = [
        1
        2
        3
        5
        8
        13
        21
    ]
    sum = 0
    for i in numbers by 1
        sum += i

    expect = 53
    validate.assert.test 'Access all array items using []', ->
        validate.assert sum is expect, "sum equals #{expect}"
)()
require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test "Aggregate Array Operations", ->
    validate.assert null, "--------------------------"

(fn = ->
    nums = []
    for i in [0..9] by 1
        nums[i] = i+1
    samenums = nums
    nums[0] = 400

    validate.assert.test 'shallow copy', ->
        validate.assert nums[0] is samenums[0], "samenums[0] equals nums[0]"
)()

(fn = ->
    copy = (arr1, arr2) ->
        for item,i in arr1 by 1
            arr2[i] = item

    nums = []
    for i in [0..9] by 1
        nums[i] = i+1
    samenums = []
    copy(nums, samenums)
    nums[0] = 400

    validate.assert.test 'deep copy', ->
        validate.assert nums[0] isnt samenums[0], "samenums[0] does not equal nums[0]"
)()

(fn = ->
    nums = [
        1
        2
        3
        4
        5
    ]

    expect = '1,2,3,4,5'
    validate.assert.test 'echo contents of an array', ->
        validate.assert nums.toString() is expect, "nums.toString() equals #{expect}"
)()
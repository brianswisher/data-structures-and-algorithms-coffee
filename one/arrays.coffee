require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test "Arrays", ->
    validate.assert null, "------"

(fn = ->
    numbers = []

    expect = [
        true
        0
    ]
    validate.assert.test 'Array literal notation', ->
        validate.assert Array.isArray(numbers) is expect[0], "numbers is an Array"
        validate.assert numbers.length is expect[1], "numbers has zero length"
)()

(fn = ->
    numbers = [1..5]

    expect = 5
    validate.assert.test 'Array literal notation w/ items', ->
        validate.assert numbers.length is expect, "numbers length is #{expect}"
)()

(fn = ->
    numbers = new Array(1,2,3,4,5)

    expect = 5
    validate.assert.test 'Array constructor', ->
        validate.assert numbers.length is expect, "numbers length is #{expect}"
)()

(fn = ->
    numbers = new Array(10)

    expect = 10
    validate.assert.test 'Array constructor w/ length argument', ->
        validate.assert numbers.length is expect, "numbers length is #{expect}"
)()

(fn = ->
    items = [
      1
      'Joe'
      true
      null
    ]

    expect = true
    validate.assert.test 'Array containing multiple types', ->
        validate.assert Array.isArray(items) is expect, "items is an Array"
)()

(fn = ->
    numbers = 3
    arr = [
      7
      4
      1776
    ]

    expect = [
        false
        true
    ]
    validate.assert.test 'Array verification', ->
        validate.assert Array.isArray(numbers) is expect[0], "numbers is not an Array"
        validate.assert Array.isArray(arr) is expect[1], "arr is an Array"
)()

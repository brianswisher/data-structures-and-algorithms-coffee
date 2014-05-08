require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test "Functions", ->
    validate.assert null, "---------"

(fn = ->
    factorial = (number) ->
      product = 1
      i = number

      while i >= 1
        product *= i
        --i
      product

    expect = [
        24
        120
        3628800
    ]
    validate.assert.test 'A value-returning function', ->
        validate.assert factorial(4) is expect[0], "factorial(4) returns #{expect[0]}"
        validate.assert factorial(5) is expect[1], "factorial(5) returns #{expect[1]}"
        validate.assert factorial(10) is expect[2], "factorial(10) returns #{expect[2]}"
)()

(fn = ->
    curve = (arr, amount) ->
        i + amount for i in arr

    grades = [
        77
        73
        74
        81
        90
    ]

    expect = '82,78,79,86,95'
    validate.assert.test 'A subprocedure or void function', ->
        validate.assert curve(grades, 5).toString() is expect, "curve(grades, 5).toString() returns '#{expect}'"
)()

(fn = ->
    factorial = (number) ->
        if number is 1 then number else number * factorial(number-1)

    expect = 120
    validate.assert.test 'recursion', ->
        validate.assert factorial(5) is expect, "factorial(5) returns #{expect}"
)()

require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test "Arithmetic and Math Library Functions", ->
    validate.assert null, "-------------------------------------"

(fn = ->
    x = 3
    y = 1.1
    total = x + y

    expect = 4.1
    validate.assert.test 'addition', ->
        validate.assert total is expect, "#{x} plus #{y} equals #{expect}\n"
)()

(fn = ->
    x = 3
    y = 1.1
    total = x * y;

    expect = 3.3000000000000003
    validate.assert.test 'multiplication', ->
        validate.assert total is expect, "#{x} multiplied by #{y} equals #{expect}\n"
)()

(fn = ->
    x = 3
    y = 1.1
    total = y / x;

    expect = 0.3666666666666667
    validate.assert.test 'division', ->
        validate.assert total is expect, "#{y} divided by #{x} equals #{expect}\n"
)()

(fn = ->
    x = 3
    y = 1.1
    total = (x + y) * (x - y);

    expect = 7.789999999999999
    validate.assert.test 'multiplication w/ parens', ->
        validate.assert total is expect, "(#{x} plus #{y}) multiplied by (#{x} minus #{y}) equals #{expect}\n"
)()

(fn = ->
    x = 9
    total = Math.sqrt(x)

    expect = 3
    validate.assert.test 'Math.sqrt (square root)', ->
        validate.assert total is expect, "square root of #{x} is #{expect}\n"
)()

(fn = ->
    x = -10
    total = Math.abs(x)

    expect = 10
    validate.assert.test 'Math.abs (absolute)', ->
        validate.assert total is expect, "absolute value of #{x} is #{expect}\n"
)()

(fn = ->
    x = 3
    y = 1.1
    z = x * y
    total = z.toFixed(2)

    expect = 3.30
    validate.assert.test 'toFixed', ->
        validate.assert total != expect, "#{z}.toFixed(2) does not equal #{expect}"
        validate.assert total = expect.toFixed(2), "#{z}.toFixed(2) does equal #{expect}.toFixed(2)"
)()

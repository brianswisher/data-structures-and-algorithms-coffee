require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test "Array mutator functions", ->
    validate.assert null, ""

nums = null

(fn = ->
    nums = [
        1
        2
        3
        4
        5
    ]

    validate.assert.test "Adding to the end of an array", ->
        validate.assert null, "-----------------------------"

    validate.assert null, 'Before push'
    validate.assert "#{nums}" is '1,2,3,4,5', '"#{nums}" is "1,2,3,4,5"'

    nums.push 6

    validate.assert null, 'After push'
    validate.assert "#{nums}" is '1,2,3,4,5,6', '"#{nums}" is "1,2,3,4,5,6"'
)()

(fn = ->
    newnum = 1
    N = nums.length

    validate.assert.test "\nAdding to the beginning of an array", ->
        validate.assert null, "-----------------------------------"

    validate.assert null, 'Before manual unshift'
    validate.assert "#{nums}" is '1,2,3,4,5,6', '"#{nums}" is "1,2,3,4,5,6"'

    for num in [N..1] by -1
        nums[N] = nums[N-1]
        N--
    nums[0] = newnum

    validate.assert null,  'After manual unshift'
    validate.assert "#{nums}" is '1,1,2,3,4,5,6', '"#{nums}" is "1,1,2,3,4,5,6"'

    nums = [
        2
        3
        4
        5
    ]

    validate.assert null, 'Before unshift function'
    validate.assert "#{nums}" is '2,3,4,5', '"#{nums}" is "2,3,4,5"'

    newnum = 1
    nums.unshift newnum

    validate.assert null, 'After unshift function'
    validate.assert "#{nums}" is '1,2,3,4,5', '"#{nums}" is "1,2,3,4,5"'

    nums = [
        3
        4
        5
    ]

    validate.assert null, 'Before unshift function'
    validate.assert "#{nums}" is '3,4,5', '"#{nums}" is "3,4,5"'

    nums.unshift newnum, 2

    validate.assert null, 'After unshift w/ multiple function'
    validate.assert "#{nums}" is '1,2,3,4,5', '"#{nums}" is "1,2,3,4,5"'

)()

(fn = ->
    nums = [
        1
        2
        3
        4
        5
        9
    ]

    validate.assert.test "\nRemoving elements from the end of an array", ->
        validate.assert null, "------------------------------------------"

    validate.assert null, 'Before pop'
    validate.assert "#{nums}" is '1,2,3,4,5,9', '"#{nums}" is "1,2,3,4,5,9"'

    nums.pop()
    validate.assert null, 'After pop'
    validate.assert "#{nums}" is '1,2,3,4,5', '"#{nums}" is "1,2,3,4,5"'

)()

(fn = ->
    nums = [
        9
        1
        2
        3
        4
        5
    ]

    validate.assert.test "\nRemoving elements from the beginning of an array", ->
        validate.assert null, "------------------------------------------------"

    validate.assert null, 'Before manual shift'
    validate.assert "#{nums}" is '9,1,2,3,4,5', '"#{nums}" is "9,1,2,3,4,5"'

    for i in [0...nums.length]
        val = nums[i + 1]
        if val then nums[i] = val else nums.splice(i,1)

    validate.assert null, 'After manual shift'
    validate.assert "#{nums}" is '1,2,3,4,5', '"#{nums}" is "1,2,3,4,5"'

    nums = [
        9
        1
        2
        3
        4
        5
    ]

    validate.assert null, 'Before a normal shift', ->
    validate.assert "#{nums}" is '9,1,2,3,4,5', '"#{nums}" is "9,1,2,3,4,5"'

    nums.shift()

    validate.assert null, 'After a  normal shift'
    validate.assert "#{nums}" is '1,2,3,4,5', '"#{nums}" is "1,2,3,4,5"'
)()

(fn = ->
    nums = [
        6
        1
        2
        3
        4
        5
    ]
    first = nums.shift()
    last = nums.pop()
    nums.push first
    nums.unshift last

    validate.assert.test 'Pop & Shift return the values they remove', ->
        validate.assert first is 6, "The first value equals 6"
        validate.assert last is 5, "The last value equals 5"
        validate.assert "#{nums}" is '5,1,2,3,4,6', '"#{nums}" equals "5,1,2,3,4,6"'
)()

(fn = ->
    nums = [
        1
        2
        3
        7
        8
        9
    ]
    validate.assert.test "\nAdding and removing elements from the middle of an array", ->
        validate.assert null, "--------------------------------------------------------"

    validate.assert null, 'Before splice'
    validate.assert "#{nums}" is '1,2,3,7,8,9', '"#{nums} equals "1,2,3,7,8,9"'

    newElements = [
        4
        5
        6
    ]
    nums.splice 3, 0, newElements

    validate.assert null, 'After splice w/ single named array'
    validate.assert "#{nums}" is '1,2,3,4,5,6,7,8,9', '"#{nums}" equals "1,2,3,4,5,6,7,8,9"'
    validate.assert nums.length is 7, 'nums has seven items'

    nums = [
        1
        2
        3
        7
        8
        9
    ]
    validate.assert null, 'Before splice addition'
    validate.assert "#{nums}" is '1,2,3,7,8,9', '"#{nums} equals "1,2,3,7,8,9"'

    nums.splice 3, 0, 4, 5, 6
    validate.assert null, 'After splice addition w/ multiple items'
    validate.assert "#{nums}" is '1,2,3,4,5,6,7,8,9', '"#{nums}" equals "1,2,3,4,5,6,7,8,9"'
    validate.assert nums.length is 9, 'nums has nine items'

)()

(fn = ->
    nums = [
        1
        2
        3
        100
        200
        300
        400
        4
        5
    ]
    validate.assert null, 'Before splice removal'
    validate.assert "#{nums}" is '1,2,3,100,200,300,400,4,5', '"#{nums}"" equals "1,2,3,100,200,300,400,4,5"'

    nums.splice 3, 4

    validate.assert null, 'After splice removal'
    validate.assert "#{nums}" is '1,2,3,4,5', '"#{nums}" equals "1,2,3,4,5"'
)()

(fn = ->
    validate.assert null, 'Before reverse'
    validate.assert "#{nums}" is '1,2,3,4,5', '"#{nums}"" equals "1,2,3,4,5"'

    nums.reverse()

    validate.assert null, 'After reverse'
    validate.assert "#{nums}" is '5,4,3,2,1', '"#{nums}" equals "5,4,3,2,1"'
)()

(fn = ->
    names = [
        'David'
        'Mike'
        'Cynthia'
        'Clayton'
        'Bryan'
        'Raymond'
    ]
    validate.assert null, 'Before sort'
    validate.assert "#{names}" is 'David,Mike,Cynthia,Clayton,Bryan,Raymond', '"#{names}" equals "David,Mike,Cynthia,Clayton,Bryan,Raymond"'

    names.sort()
    validate.assert null, 'After sort'
    validate.assert "#{names}" is 'Bryan,Clayton,Cynthia,David,Mike,Raymond', '"#{names}" equals "Bryan,Clayton,Cynthia,David,Mike,Raymond"'
)()

(fn = ->
    nums = [
        3
        1
        2
        100
        4
        200
    ]
    validate.assert null, 'Before sort'
    validate.assert "#{nums}" is '3,1,2,100,4,200', '"#{nums}" equals "3,1,2,100,4,200"'

    nums.sort()
    validate.assert null, 'After sort'
    validate.assert "#{nums}" is '1,100,2,200,3,4', '"#{nums}" equals "1,100,2,200,3,4"'

    compare = (num1, num2) ->
        num1 - num2

    nums.sort compare

    validate.assert null, 'After sort w/ comparator'
    validate.assert "#{nums}" is '1,2,3,4,100,200', '"#{nums}" equals "1,2,3,4,100,200"'
)()

require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test 'Non-array-generating iterator functions', ->
    validate.assert null, "---------------------------------------"

nums = null

output = ''

square = (num) ->
        output += "#{num} #{num * num}\n"

isEven = (num) ->
    num % 2 is 0

checkForAllEven = ->
    if nums.every(isEven) then 'all numbers are even'
    else 'not all numbers are even'

checkForSomeEven = ->
    if nums.some(isEven) then 'some of the numbers are even'
    else 'no numbers are even'

add = (runnningTotal, currentValue) ->
    runnningTotal + currentValue

concat = (accumulatedString, item) ->
    accumulatedString + item

(fn = ->
    validate.assert.test '\nforEach', ->
        validate.assert null, "-------"

    nums = [
        1
        2
        3
        4
        5
        6
        7
        8
        9
        10
    ]
    validate.assert.test 'Before forEach(square)', ->
        validate.assert "#{nums}" is '1,2,3,4,5,6,7,8,9,10', '"#{nums}" equals "1,2,3,4,5,6,7,8,9,10"'
        validate.assert "#{output}" is '', '"#{output}" equals ""'

    nums.forEach square
    validate.assert null, 'After forEach(square)'
    validate.assert "#{output}" is '1 1\n2 4\n3 9\n4 16\n5 25\n6 36\n7 49\n8 64\n9 81\n10 100\n', '"#{output}" equals "1 1\n2 4\n3 9\n4 16\n5 25\n6 36\n7 49\n8 64\n9 81\n10 100\n"'

)()

(fn = ->
    validate.assert.test '\nevery', ->
        validate.assert null, "-----"


    output = null
    validate.assert.test 'Before every(isEven)', ->
        validate.assert "#{nums}" is '1,2,3,4,5,6,7,8,9,10', '"#{nums}" equals "1,2,3,4,5,6,7,8,9,10"'
        validate.assert output is null, 'output equals null'

    output = nums.every(isEven)
    validate.assert null, 'After every(isEven)'
    validate.assert output is false, 'output equals false'

    nums = [
        2
        4
        6
        8
        10
    ]
    validate.assert null, 'Before every(isEven)'
    validate.assert "#{nums}" is '2,4,6,8,10', '"#{nums}" equals "2,4,6,8,10"'

    output = checkForAllEven()
    validate.assert null, 'After every(isEven)'
    validate.assert output is 'all numbers are even', 'output equals "all numbers are even"'

    nums.push 11
    validate.assert null, 'Before every(isEven)'
    validate.assert "#{nums}" is '2,4,6,8,10,11', '"#{nums}" equals "2,4,6,8,10,11"'

    output = checkForAllEven()
    validate.assert null, 'After every(isEven)'
    validate.assert output is 'not all numbers are even', 'output equals "not all numbers are even"'

)()

(fn = ->
    validate.assert.test '\nsome', ->
        validate.assert null, '----'

    output = checkForSomeEven()
    validate.assert null, 'After some'
    validate.assert output is 'some of the numbers are even', 'output equals "some of the numbers are even"'

    nums = [
        1
        3
        5
        7
        9
    ]
    validate.assert null, 'Before some(isEven)'
    validate.assert "#{nums}" is '1,3,5,7,9', '"#{nums}" equals "1,3,5,7,9"'

    output = checkForSomeEven()
    validate.assert null, 'After some(isEven)'
    validate.assert output is 'no numbers are even', 'output equals "no numbers are even"'

)()

(fn = ->
    validate.assert.test '\nreduce', ->
        validate.assert null, '------'

    nums = [
        1
        2
        3
        4
        5
        6
        7
        8
        9
        10
    ]
    sum = null
    validate.assert.test 'Before reduce(add)', ->
        validate.assert "#{nums}" is '1,2,3,4,5,6,7,8,9,10', '"#{nums}" equals "1,2,3,4,5,6,7,8,9,10"'
        validate.assert sum is null, 'sum equals null'

    sum = nums.reduce(add)
    validate.assert null, 'After reduce(add)'
    validate.assert sum is 55, 'sum equals 55'

    words = [
        'the '
        'quick '
        'brown '
        'fox '
    ]
    sentence = null
    validate.assert.test 'Before reduce(concat)', ->
        validate.assert "#{words}" is 'the ,quick ,brown ,fox ', '"#{words}" equals "the ,quick ,brown ,fox "'
        validate.assert sentence is null, 'sentence is null'

    sentence = words.reduce(concat)
    validate.assert null, 'After reduce(concat)'
    validate.assert sentence is 'the quick brown fox ', 'sentence equals "the quick brown fox "'

    validate.assert.test '\nreduceRight', ->
        validate.assert null, '-----------'

    sentence = words.reduceRight(concat)
    validate.assert null, 'After reduceRight(concat)'
    validate.assert sentence is 'fox brown quick the ', 'sentence equals "fox brown quick the "'
)()

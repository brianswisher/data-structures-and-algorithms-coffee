require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test 'Non-array-generating iterator functions', ->
    validate.assert null, '-------------------'

(fn = ->
    validate.assert.test 'map', ->
        validate.assert null, '---'

    grades = [
        77
        65
        81
        92
        83
    ]

    curve = (grade) ->
        grade += 5

    newgrades = grades.map(curve)
    validate.assert.test 'grades.map(curve)', ->
        validate.assert "#{grades}" is '77,65,81,92,83', '"#{grades}" equals "77,65,81,92,83"'
        validate.assert "#{newgrades}" is '82,70,86,97,88', '"#{newgrades}" equals "82,70,86,97,88"'

    words = [
        'for'
        'your'
        'information'
    ]

    first = (word) ->
        word[0]

    acronym = words.map(first).join('')
    validate.assert.test 'words.map(first)', ->
        validate.assert "#{words}" is 'for,your,information', '"#{words}" equals "for,your,information"'
        validate.assert acronym is 'fyi', 'acronym equals "fyi"'

)()

(fn = ->
    validate.assert.test '\nfilter', ->
        validate.assert null, '------'

    isEven = (num) ->
        num % 2 is 0

    isOdd = (num) ->
        num % 2 isnt 0

    nums = []

    for i in [0...20] by 1
        nums[i] = i+1

    evens = nums.filter(isEven)
    odds = nums.filter(isOdd)

    validate.assert.test 'nums.filter', ->
        validate.assert nums.length is 20, 'nums.length is 20'
        validate.assert "#{evens}" is '2,4,6,8,10,12,14,16,18,20', '"#{evens}" equals "2,4,6,8,10,12,14,16,18,20"'
        validate.assert "#{odds}" is '1,3,5,7,9,11,13,15,17,19', '"#{odds}" equals "1,3,5,7,9,11,13,15,17,19"'

    passing = (num) ->
        num >= 60

    grades = []
    for i in [0...20] by 1
        grades[i] = Math.floor(Math.random() * 101)

    passGrades = grades.filter(passing)
    validate.assert.test 'grades.filter(passing)', ->
        validate.assert grades.length is 20, 'grades.length is 20'
        validate.assert true, "nonfiltered: #{grades}"
        validate.assert true, "filtered:    #{passGrades}"

    afterc = (str) ->
        str.indexOf('cie') > -1

    words = [
        'recieve'
        'deceive'
        'percieve'
        'deceit'
        'concieve'
    ]

    misspelled = words.filter(afterc);
    validate.assert.test 'grades.filter(afterc)', ->
        validate.assert misspelled.length is 3, 'misspelled.length is 3'
        validate.assert true, "nonfiltered: #{words}"
        validate.assert true, "filtered:    #{misspelled}"


)()

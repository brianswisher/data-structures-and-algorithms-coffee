require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test "Creating Arrays from Strings", ->
    validate.assert null, "----------------------------"

(fn = ->
    sentence = 'the quick brown fox jumped over the lazy dog'
    words = sentence.split(' ')
    output = ''
    i = 0
    for word,i in words by 1
        output += "word #{i}: #{word}\n"

    parts = [
        'word 0: the'
        'word 2: brown'
        'word 3: fox'
        'word 4: jumped'
        'word 5: over'
        'word 6: the'
        'word 7: lazy'
        'word 8: dog'
    ]
    expect = parts.some (part) -> ~output.indexOf part

    validate.assert.test 'Using split', ->
        validate.assert expect, "The parts match the output."
)()
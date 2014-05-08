require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test "Arrays Accessor Functions", ->
    validate.assert null, "-------------------"

names = null
cisDept = null
dmpDept = null
itDiv = null

(fn = ->
    name = process.argv[2] or 'Clayton'
    names = [
        'David'
        'Mike'
        'Cynthia'
        'Raymond'
        'Clayton'
        'Mike'
        'Jennifer'
    ]
    position = names.indexOf name

    result = if position >= 0
    then "Found #{name} at position #{position}" else "#{name} not found in array"

    validate.assert.test 'Searching for a value', ->
        validate.assert position >= 0, "#{result}"
)()

(fn = ->
    name = 'Mike'
    firstPos = names.indexOf name
    lastPos = names.lastIndexOf name
    validate.assert.test 'Searching for multiple values', ->
        validate.assert firstPos is 1, "First found #{name} at position #{firstPos}"
        validate.assert lastPos is 5, "Last found #{name} at position #{lastPos}"
)()

(fn = ->
    validate.assert.test 'String representations of arrays', ->
        validate.assert names.toString() is names.join() is "#{names}", "names.toString() is names.join() is \"\#{names}\""
)()

(fn = ->
    cisDept = names.slice(4,7)

    validate.assert.test 'Creating a new array with slice', ->
        validate.assert cisDept[0] is names[4], "cisDept[0] is names[4] which is \"#{cisDept[0]}\""
        validate.assert cisDept[1] is names[5], "cisDept[1] is names[5] which is \"#{cisDept[1]}\""
        validate.assert cisDept[2] is names[6], "cisDept[2] is names[6] which is \"#{cisDept[2]}\""
)()

(fn = ->
    dmpDept = [
        'Raymond'
        'Sue'
        'Brian'
    ]
    itDiv = dmpDept.concat(cisDept)

    validate.assert.test 'Creating a new array w/ concat', ->
        validate.assert itDiv.length is 6, "itDiv.length equals 6"
        validate.assert itDiv[0] is dmpDept[0], "itDiv[0] equals dmpDept[0] which is \"#{itDiv[0]}\""
        validate.assert itDiv[0] is dmpDept[0], "itDiv[1] equals dmpDept[1] which is \"#{itDiv[1]}\""
        validate.assert itDiv[2] is dmpDept[2], "itDiv[2] equals dmpDept[2] which is \"#{itDiv[2]}\""
        validate.assert itDiv[3] is cisDept[0], "itDiv[3] is cisDept[0] which is \"#{itDiv[3]}\""
        validate.assert itDiv[4] is cisDept[1], "itDiv[4] is cisDept[1] which is \"#{itDiv[4]}\""
        validate.assert itDiv[5] is cisDept[2], "itDiv[5] is cisDept[2] which is \"#{itDiv[5]}\""
)()

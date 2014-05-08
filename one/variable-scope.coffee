require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test "Variable Scope", ->
    validate.assert null, "--------------"

(fn = ->
    showScope = ->
      scope

    scope = 'global'

    expect = 'global'
    validate.assert.test 'global scope', ->
        validate.assert scope is expect, "scope equals '#{expect}'"
        validate.assert showScope() is expect, "showScope() returns '#{expect}'"
)()

(fn = ->
    showScope = ->
      scope = 'local'

    scope = 'global'

    expect = [
      'global'
      'local'
    ]
    validate.assert.test 'local scope', ->
        validate.assert scope is expect[0], "scope equals '#{expect[0]}'"
        validate.assert showScope() is expect[1], "showScope() returns '#{expect[1]}'"
)()

(fn = ->
    showScope = ->
      `scope = 'local'`

    scope = 'global'

    expect = [
      'global'
      'local'
    ]
    validate.assert.test 'ramification of overusing globals', ->
        validate.assert scope is expect[0], "scope equals '#{expect[0]}'"
        validate.assert showScope() is expect[1], "showScope() returns '#{expect[1]}'"
        validate.assert scope isnt expect[0], "scope does not equal '#{expect[0]}'"
        validate.assert scope is expect[1], "scope equals '#{expect[1]}'"
)()

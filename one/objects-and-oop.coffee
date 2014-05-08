require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test "Objects and Object-Oriented Programming", ->
    validate.assert null, "--------------------------------"

(fn = ->
    class Checking
        constructor: (amount) ->
            @balance = amount

        deposit: (amount) ->
            @balance += amount

        withdraw: (amount) ->
            @balance -= amount  if amount <= @balance
            "Insufficient funds"  if amount > @balance

        toString: ->
            "Balance: #{@balance}"

    account = new Checking(500)

    account.deposit 1000
    expect = 'Balance: 1500'
    validate.assert.test 'Checking object', ->
        validate.assert "#{account}" is expect, "account.toString() returns '#{expect}'"

    account.withdraw 750
    expect = 'Balance: 750'
    validate.assert "#{account}" is expect, "account.toString() returns '#{expect}'"

    withdraw = account.withdraw 800
    expect = 'Insufficient funds'
    validate.assert withdraw is expect, "account.withdraw(800) return '#{expect}'"
)()

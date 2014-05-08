((exports) ->
    testData = []
    queue = []
    paused = false
    assert = (value, desc) ->
        if value is null
            state = 'neutral'
            prefix = ''
        else
            state = if value then 'pass' else 'fail'
            prefix = if value then '✓ ' else '✖ '
        if not testData.length
            assert.print({label:desc,state:state})
        else
            testData.push {
                label: "#{prefix}#{desc}",
                state: state
            }
            if testData[0].state is 'neutral' or 'fail'
                testData[0].state = state

    assert.pass = 'green'
    assert.fail = 'red'
    assert.neutral = 'grey'

    assert.test = (name, fn) ->
        queue.push ->
            testData.push {
                label: name,
                state: assert.neutral,
                invert: true
            }
            fn()
            while testData.length
                data = testData.shift()
                assert.print(data)
        assert.runTest()

    assert.pause = ->
        paused = true

    assert.resume = ->
        paused = false;
        setTimeout assert.runTest, 1;

    assert.runTest = ->
        if !paused and queue.length
            queue.shift()()
            if !paused
                assert.resume()


    assert.print = (data) ->
        if data.invert
            console.log "%c#{data.label}", "background-color:#{assert[data.state]}; color: white"
        else
            console.log "%c#{data.label}", "color:#{assert[data.state]}"

    exports.assert = assert
) (if typeof exports is 'undefined' then this['myModule'] ||= {} else exports)
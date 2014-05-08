require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test 'Arrays of objects', ->
    validate.assert null, '-----------------'

(fn = ->
    Point = (@x, @y) ->
    displayPts = (arr) ->
        op = []
        for item in arr by 1
            op.push "#{item.x}, #{item.y}"
        op
    p1 = new Point(1,2)
    p2 = new Point(3,5)
    p3 = new Point(2,8)
    p4 = new Point(4,4)
    points = [
        p1
        p2
        p3
        p4
    ]
    op = []
    for point,i in points by 1
        op.push "Point #{i + 1}: #{point.x}, #{point.y}"

    p5 = null
    validate.assert.test 'Points app', ->
        validate.assert op, op.join '\n'
        validate.assert points.push(new Point(12, -3)), 'After push:'
        validate.assert op = displayPts(points), op.join '\n'
        validate.assert op[4].indexOf('12, -3') > -1, 'last point is 12, -3'
        validate.assert op[0].indexOf('1, 2') > -1, 'first point is 1, 2'
        validate.assert points.shift(), 'After shift:'
        validate.assert op = displayPts(points), op.join '\n'
        validate.assert op[0].indexOf('3, 5') > -1, 'first point is 3, 5'
        validate.assert op[3].indexOf('12, -3') > -1, 'last point is 12, -3'

)()
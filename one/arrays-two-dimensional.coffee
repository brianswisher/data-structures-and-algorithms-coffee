require 'coffee-script/register'
validate = require('../lib/assert-module').assertModule

validate.assert.test '2D Arrays', ->
    validate.assert null, '---------'

(->
    twod = []
    rows = 5
    for i in [0...5] by 1
        twod[i] = []

    validate.assert.test 'Simple creation, but elements are undefined', ->
        validate.assert twod.length is 5, 'twod.length equals 5'
        validate.assert true, "#{twod}"
        validate.assert twod.join('') is '', 'twod.join(" ") equals ""'
)()

(->
    Array.matrix = (numrows, numcols, initial) ->
        arr = []
        for i in [0...numrows] by 1
            columns = []
            for j in [0...numcols] by 1
                columns[j] = initial
            arr[i] = columns
        arr

    validate.assert.test 'Extend array object to create 2d arrays w/ initial values', ->
        validate.assert nums = Array.matrix(5,5,0), "nums: #{nums}"
        validate.assert nums.length is 5, 'nums.length is 5'
        validate.assert nums[1][1] is 0, 'nums[1][1] is 0'
        validate.assert names = Array.matrix(3,3,''), "names: #{names}"
        validate.assert names[1][2] = 'Joe', "name[1][2] = #{names[1][2]} //Joe"
)()

grades = null

(->
    fn = ->
       grades = [[89,77,78],[76,82,81],[91,94,89]]
    validate.assert.test 'Small data sets can be defined in one line', ->
        validate.assert fn, "#{fn}"
        validate.assert fn(), "grades: #{grades}"
        validate.assert grades[2][2] is 89, 'grades[2][2] is 89'
)()

getStudentGrades = null

(->
    getStudentGrades = (grades) ->
        arr = []
        for row,r in grades by 1
            total = 0
            average = 0.0
            for col,c in row by 1
                total += grades[r][c]
            average = total / grades[r].length
            arr.push "Student #{r + 1} average: #{average.toFixed(2)}"
            total = 0
            average = 0.0
        arr
    output = getStudentGrades(grades)
    validate.assert.test 'process 2d array col-wise', ->
        validate.assert grades, "grades: #{grades}"
        validate.assert output, "#{output}"
)()

(->
    fn = ->
        arr = []
        for col,c in grades by 1
            total = 0
            average = 0.0
            for row,r in col by 1
                total += grades[r][c]
            average = total / grades[c].length
            arr.push "Test #{r + 1} average: #{average.toFixed(2)}"
            total = 0
            average = 0.0
        arr
    output = fn()
    validate.assert.test 'process 2d array row-wise', ->
        validate.assert grades, "grades: #{grades}"
        validate.assert output, "#{output}"
)()

(->
    grades = [
        [
            89
            77
        ]
        [
            76
            82
            81
        ]
        [
            91
            94
            89
            99
        ]
    ]
    output = getStudentGrades(grades)
    validate.assert.test 'process jagged array', ->
        validate.assert grades, "grades: #{grades}"
        validate.assert output, "#{output}"
)()

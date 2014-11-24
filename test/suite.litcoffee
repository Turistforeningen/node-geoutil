    assert = require 'assert'
    geoutil = require '../src/'

    describe 'pointDistance()', ->
      it 'should return distance in meters', ->
        dist = geoutil.pointDistance [ 60.39826, 5.32907 ], [ 60.62869, 6.41474 ]
        assert.equal dist, 64781.55866944858

    describe 'lineDistance()', ->
      it 'should return distance in meters', ->
        dist = geoutil.lineDistance [
          [ 61.498792, 8.636448 ]
          [ 61.500270, 8.652638 ]
          [ 61.499957, 8.660266 ]
          [ 61.501822, 8.672846 ]
          [ 61.503748, 8.696228 ]
        ]
        assert.equal dist, 3242.1939683950695

    describe 'polygonArea()', ->
       it 'should return are in meters for polygon without rings', ->
         console.log geoutil.polygonArea [[
          [ 61.498792, 8.636448 ]
          [ 61.500270, 8.652638 ]
          [ 61.499957, 8.660266 ]
          [ 61.501822, 8.672846 ]
          [ 61.503748, 8.696228 ]
          [ 61.498792, 8.636448 ]
        ]]


Geoutil for Node.JS
===================

# Install

```
npm install geoutil --save
```

# Usage

## pointDistance()

```javascript
var pointA = [ 60.39826, 5.32907 ];
var pointB = [ 60.62869, 6.41474 ];

geoutil.pointDistance(pointA, pointB);
// 64781.55866944858
```

## lineDistance()

```javascript
var line = [
  [ 61.498792, 8.636448 ],
  [ 61.500270, 8.652638 ],
  [ 61.499957, 8.660266 ],
  [ 61.501822, 8.672846 ],
  [ 61.503748, 8.696228 ]
];

geoutil.polygonArea(line);
// 532.126784613296
```

# [MIT License](https://raw.githubusercontent.com/Turistforeningen/node-geoutil/master/LICENSE)


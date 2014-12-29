## Constants

`R` is a fairly accurate radius of the earth in `meters`.

    exports.constants =
      R: 6378137

    exports.rad = Math.PI / 180
    exports.deg = 180 / Math.PI

## pointDistance()

**Time Complexity:** O(1)

Compute the distance between two points on a sphere from their longitudes and
latitudes using the [haversine
formula](http://en.wikipedia.org/wiki/Haversine_formula).

Other notable implemetations of the haversine formula in JavaScript are
[Leaflet](https://github.com/Leaflet/Leaflet/blob/master/src/geo/crs/CRS.Earth.js)
and [Movable Type Scripts](http://www.movable-type.co.uk/scripts/latlong.html).

### Params

* `Array` p1 - first point
* `Array` p2 - second point

### Return

Returns the distance from `p1` to `p2` in `meters`.

    exports.pointDistance = (p1, p2) ->
      #p1 = p1.coordinates.reverse() if p1.coordinates
      #p2 = p2.coordinates.reverse() if p2.coordinates

      φ1 = p1[0] * exports.rad
      φ2 = p2[0] * exports.rad
      Δφ = (p2[0] - p1[0]) * exports.rad
      Δλ = (p2[1] - p1[1]) * exports.rad

      a = Math.sin(Δφ/2) * Math.sin(Δφ/2) + \
          Math.cos(φ1)   * Math.cos(φ2)   * \
          Math.sin(Δλ/2) * Math.sin(Δλ/2)

      c = 2 * Math.atan2 Math.sqrt(a), Math.sqrt(1-a)

      exports.constants.R * c

## lineDistance()

**Time Complexity:** O(N) where N is the number of points on the line.

Compute the distance for a line on a sphere using the haversine formula.

## Params

* `Array` line - the line

## Return

Return the total distance for `line` in `meters`.

    exports.lineDistance = (line) ->
      dist = 0

      for _, i in line when i > 0
        dist += exports.pointDistance line[i-1], line[i]

      dist

## polygonArea()

**Time Complexity:** O(N) where N is the number of points in the polygon.

Compute the area of a polygon on a sphere.

## Params

* `Array` poly - the polygon

## Return

Return the total area for `poly` in `meters^2`.

    exports.polygonArea = (poly) ->
      area = 0

      for _, i in poly[0] when i > 0
        p1 = poly[0][i-1]
        p2 = poly[0][i]

        area += p1[1] * p2[0]
        area -= p1[0] * p2[1]

      exports.constants.R * area / 2


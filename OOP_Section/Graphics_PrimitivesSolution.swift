//
//  Graphics_PrimitivesSolution.swift
//  
//
//  Created by Rodrigo Leyva on 12/4/21.
//

import Foundation
struct Point{
    let x: Double
    let y: Double
    
}


struct Line{
    let start: Point
    let end: Point
    
    func length() -> Double{
        // Distance between 2 points formula :
        // https://www.cuemath.com/geometry/distance-between-two-points/
        
        //formula: d = sqrt( (x2-x1)^2 + (y2-y1)^2 )
        
        let distance = sqrt(pow((end.x - start.x), 2) + pow((end.y - start.y), 2))
        
        return distance
    }
}
let start = Point(x: 3, y: 4)
let end = Point(x: 5, y: 7)

let line = Line(start: start, end: end)

print(line.length())

//optional

struct Triangle{
    var points: [Point]
    
    func area() -> Double{
        
        var area = 0.5 * (points[0].x * (points[1].y - points[2].y) +
                          points[1].x * (points[2].y - points[0].y) +
                          points[2].x * (points[0].y - points[1].y))
        return abs(area)
    }
    
}

let a = Point(x: 3, y: 4)
let b = Point(x: 4, y: 7)
let c = Point(x: 6, y: -3)

let tri = Triangle(points: [a,b,c])

print(tri.area())

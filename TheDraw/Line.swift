//
//  Line.swift
//  TheDraw
//
//  Created by Josh Meek on 7/25/14.
//  Copyright (c) 2014 josmek. All rights reserved.
//

import UIKit

class Line {
    var start: CGPoint
    var end: CGPoint
    var color: UIColor
    
    init(start _start: CGPoint, end _end: CGPoint, color _color: UIColor!) {
    //init(start _start: CGPoint, end _end: CGPoint) {
        start = _start
        end = _end
        color = _color
    }
}
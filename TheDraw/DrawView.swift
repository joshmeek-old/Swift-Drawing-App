//
//  DrawView.swift
//  TheDraw
//
//  Created by Josh Meek on 7/25/14.
//  Copyright (c) 2014 josmek. All rights reserved.
//

import UIKit

class DrawView: UIView {

    var lines: [Line] = []
    var lastPoint: CGPoint!
    var drawColor = UIColor.blackColor()
    var lineWidth: CGFloat = 5
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        lastPoint = touches.anyObject().locationInView(self)
    }
    
    override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!) {
        var newPoint = touches.anyObject().locationInView(self)
        lines.append(Line(start: lastPoint, end: newPoint, color: drawColor))
        lastPoint = newPoint
        
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        CGContextSetLineWidth(context, lineWidth)
        CGContextSetLineCap(context, kCGLineCapRound)
        for line in lines {
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
            CGContextSetStrokeColorWithColor(context, line.color.CGColor)
            CGContextStrokePath(context)
        }
    }

}

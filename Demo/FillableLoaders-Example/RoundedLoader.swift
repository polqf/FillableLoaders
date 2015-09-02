//
//  RoundedLoader.swift
//  PQFFillableLoaders
//
//  Created by Pol Quintana on 2/8/15.
//  Copyright (c) 2015 Pol Quintana. All rights reserved.
//

import Foundation
import UIKit

public class RoundedLoader: FillableLoader {
    
    /// Height of the rounded edge of the spike
    public var spikeHeight: CGFloat = 5.0
    
    internal override func generateLoader() {
        extraHeight = spikeHeight
        layoutPath()
    }
    
    internal override func layoutPath() {
        super.layoutPath()
        shapeLayer.path = shapePath()
    }
    
    
    // MARK: Animate
    
    internal override func startAnimating() {
        if !animate { return }
        if swing { startswinging() }
        startMoving(true)
    }
    
    
    //MARK: Spikes
    
    internal func shapePath() -> CGMutablePath {
        let width = loaderView.frame.width
        let height = loaderView.frame.height
        let path = CGPathCreateMutable()
        let waves = 32
        CGPathMoveToPoint(path, nil, 0, height/2)
        
        let widthDiff = width/CGFloat(waves*2)
        var nextCPX = widthDiff
        var nextCPY = height/2 + spikeHeight
        var nextX = nextCPX + widthDiff
        let nextY = height/2
        
        for i: Int in 1...waves {
            CGPathAddQuadCurveToPoint(path, nil, nextCPX, nextCPY, nextX, nextY)
            nextCPX = nextX + widthDiff
            nextCPY = (i%2 == 0) ? height/2 + spikeHeight : height/2 - spikeHeight
            nextX = nextCPX + widthDiff
        }
        CGPathAddLineToPoint(path, nil, width + 100, height/2)
        CGPathAddLineToPoint(path, nil, width + 100, height*2)
        CGPathAddLineToPoint(path, nil, 0, height*2)
        CGPathCloseSubpath(path)
        return path
    }
    
    
    //MARK: Animations Delegate
    
    override public func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        if !animate { return }
        let key = anim.valueForKey("animation") as! String
        if key == "up" {
            startMoving(false)
        }
        if key == "down" {
            startMoving(true)
        }
        if key == "rotation" {
            startswinging()
        }
    }
}

//
//  SpikeLoader.swift
//  PQFFillableLoaders
//
//  Created by Pol Quintana on 2/8/15.
//  Copyright (c) 2015 Pol Quintana. All rights reserved.
//

import Foundation
import UIKit

open class SpikeLoader: FillableLoader {
    
    /// Height of the spike
    open var spikeHeight: CGFloat = 10.0
    
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
        guard animate else { return }
        if swing { startswinging() }
        startMoving(up: true)
    }
    
    //MARK: Spikes
    internal func shapePath() -> CGMutablePath {
        let width = loaderView.frame.width
        let height = loaderView.frame.height
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: height/2))

        let widthDiff = width/32
        var nextX = widthDiff
        var nextY = height/2 + spikeHeight
        
        for i: Int in 1...32 {
            path.addLine(to: CGPoint(x: nextX, y: nextY))
            nextX += widthDiff
            nextY += (i%2 == 0) ? spikeHeight : -spikeHeight
        }
        path.addLine(to: CGPoint(x: width + 100, y: height/2))
        path.addLine(to: CGPoint(x: width + 100, y: height*2))
        path.addLine(to: CGPoint(x: 0, y: height*2))
        path.closeSubpath()
        return path
    }
}

extension SpikeLoader {
    
    open func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard animate, let key = anim.value(forKey: "animation") as? String else { return }
        if key == "up" {
            startMoving(up: false)
        }
        else if key == "down" {
            startMoving(up: true)
        }
        if key == "rotation" {
            startswinging()
        }
    }
}

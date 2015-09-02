//
//  PlainLoader.swift
//  PQFFillableLoaders
//
//  Created by Pol Quintana on 2/8/15.
//  Copyright (c) 2015 Pol Quintana. All rights reserved.
//

import Foundation
import UIKit

public class PlainLoader: FillableLoader {
    
    internal override func generateLoader() {
        layoutPath()
    }
    
    internal override func layoutPath() {
        super.layoutPath()
        shapeLayer.path = shapePath()
    }
    
    
    // MARK: Animate
    
    internal override func startAnimating() {
        if !animate { return }
        startMoving(true)
    }
    
    internal func shapePath() -> CGMutablePath {
        let width = loaderView.frame.width
        let height = loaderView.frame.height
        
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 0, height/2)
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
    }
}

//
//  PlainLoader.swift
//  PQFFillableLoaders
//
//  Created by Pol Quintana on 2/8/15.
//  Copyright (c) 2015 Pol Quintana. All rights reserved.
//

import Foundation
import UIKit

open class PlainLoader: FillableLoader {
    
    internal override func generateLoader() {
        layoutPath()
    }
    
    internal override func layoutPath() {
        super.layoutPath()
        shapeLayer.path = shapePath()
    }
    
    
    // MARK: Animate
    
    internal override func startAnimating() {
        guard animate else { return }
        startMoving(up: true)
    }
    
    internal func shapePath() -> CGMutablePath {
        let width = loaderView.frame.width
        let height = loaderView.frame.height
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: height/2))
        path.addLine(to: CGPoint(x: width + 100, y: height/2))
        path.addLine(to: CGPoint(x: width + 100, y: height*2))
        path.addLine(to: CGPoint(x: 0, y: height*2))
        path.closeSubpath()
        return path
    }

}

extension PlainLoader {

    open func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard animate, let key = anim.value(forKey: "animation") as? String else { return }
        if key == "up" {
            startMoving(up: false)
        }
        else if key == "down" {
            startMoving(up: true)
        }
    }
}

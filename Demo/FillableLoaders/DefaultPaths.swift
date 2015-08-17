//
//  DefaultPaths.swift
//  FillableLoaders
//
//  Created by Pol Quintana on 2/8/15.
//  Copyright (c) 2015 Pol Quintana. All rights reserved.
//

import Foundation
import UIKit

struct Paths {
    static func twitterPath() -> CGPath {
        //Created with PaintCode
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(190, 281))
        bezierPath.addCurveToPoint(CGPointMake(142, 329), controlPoint1: CGPointMake(163.49, 281), controlPoint2: CGPointMake(142, 302.49))
        bezierPath.addCurveToPoint(CGPointMake(190, 377), controlPoint1: CGPointMake(142, 355.51), controlPoint2: CGPointMake(163.49, 377))
        bezierPath.addCurveToPoint(CGPointMake(238, 329), controlPoint1: CGPointMake(216.51, 377), controlPoint2: CGPointMake(238, 355.51))
        bezierPath.addCurveToPoint(CGPointMake(190, 281), controlPoint1: CGPointMake(238, 302.49), controlPoint2: CGPointMake(216.51, 281))
        bezierPath.closePath()
        bezierPath.moveToPoint(CGPointMake(209.52, 320.32))
        bezierPath.addCurveToPoint(CGPointMake(209.55, 321.55), controlPoint1: CGPointMake(209.54, 320.73), controlPoint2: CGPointMake(209.55, 321.14))
        bezierPath.addCurveToPoint(CGPointMake(182.65, 348.44), controlPoint1: CGPointMake(209.55, 334.04), controlPoint2: CGPointMake(200.04, 348.44))
        bezierPath.addCurveToPoint(CGPointMake(168.16, 344.2), controlPoint1: CGPointMake(177.31, 348.44), controlPoint2: CGPointMake(172.34, 346.88))
        bezierPath.addCurveToPoint(CGPointMake(170.41, 344.33), controlPoint1: CGPointMake(168.9, 344.28), controlPoint2: CGPointMake(169.65, 344.33))
        bezierPath.addCurveToPoint(CGPointMake(182.16, 340.28), controlPoint1: CGPointMake(174.84, 344.33), controlPoint2: CGPointMake(178.92, 342.82))
        bezierPath.addCurveToPoint(CGPointMake(173.32, 333.72), controlPoint1: CGPointMake(178.02, 340.21), controlPoint2: CGPointMake(174.53, 337.47))
        bezierPath.addCurveToPoint(CGPointMake(175.1, 333.89), controlPoint1: CGPointMake(173.9, 333.83), controlPoint2: CGPointMake(174.49, 333.89))
        bezierPath.addCurveToPoint(CGPointMake(177.59, 333.56), controlPoint1: CGPointMake(175.96, 333.89), controlPoint2: CGPointMake(176.8, 333.77))
        bezierPath.addCurveToPoint(CGPointMake(170.01, 324.28), controlPoint1: CGPointMake(173.27, 332.69), controlPoint2: CGPointMake(170.01, 328.87))
        bezierPath.addCurveToPoint(CGPointMake(170.01, 324.17), controlPoint1: CGPointMake(170.01, 324.24), controlPoint2: CGPointMake(170.01, 324.2))
        bezierPath.addCurveToPoint(CGPointMake(174.29, 325.35), controlPoint1: CGPointMake(171.28, 324.87), controlPoint2: CGPointMake(172.74, 325.3))
        bezierPath.addCurveToPoint(CGPointMake(170.09, 317.48), controlPoint1: CGPointMake(171.75, 323.65), controlPoint2: CGPointMake(170.09, 320.76))
        bezierPath.addCurveToPoint(CGPointMake(171.37, 312.73), controlPoint1: CGPointMake(170.09, 315.75), controlPoint2: CGPointMake(170.55, 314.12))
        bezierPath.addCurveToPoint(CGPointMake(190.85, 322.61), controlPoint1: CGPointMake(176.03, 318.45), controlPoint2: CGPointMake(183, 322.21))
        bezierPath.addCurveToPoint(CGPointMake(190.61, 320.45), controlPoint1: CGPointMake(190.69, 321.91), controlPoint2: CGPointMake(190.61, 321.19))
        bezierPath.addCurveToPoint(CGPointMake(200.06, 311), controlPoint1: CGPointMake(190.61, 315.23), controlPoint2: CGPointMake(194.84, 311))
        bezierPath.addCurveToPoint(CGPointMake(206.96, 313.98), controlPoint1: CGPointMake(202.78, 311), controlPoint2: CGPointMake(205.24, 312.14))
        bezierPath.addCurveToPoint(CGPointMake(212.97, 311.69), controlPoint1: CGPointMake(209.12, 313.56), controlPoint2: CGPointMake(211.14, 312.77))
        bezierPath.addCurveToPoint(CGPointMake(208.81, 316.92), controlPoint1: CGPointMake(212.26, 313.89), controlPoint2: CGPointMake(210.76, 315.75))
        bezierPath.addCurveToPoint(CGPointMake(214.24, 315.43), controlPoint1: CGPointMake(210.72, 316.69), controlPoint2: CGPointMake(212.54, 316.18))
        bezierPath.addCurveToPoint(CGPointMake(209.52, 320.32), controlPoint1: CGPointMake(212.97, 317.32), controlPoint2: CGPointMake(211.37, 318.99))
        bezierPath.closePath()
        bezierPath.miterLimit = 4;
        return bezierPath.CGPath
    }
    
    static func githubPath() -> CGPath {
        //Created with PaintCode
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(114.86, 69.09))
        bezierPath.addCurveToPoint(CGPointMake(115.66, 59.2), controlPoint1: CGPointMake(115.31, 66.12), controlPoint2: CGPointMake(115.59, 62.86))
        bezierPath.addCurveToPoint(CGPointMake(107, 35.39), controlPoint1: CGPointMake(115.64, 43.53), controlPoint2: CGPointMake(108.4, 37.99))
        bezierPath.addCurveToPoint(CGPointMake(105.55, 16.26), controlPoint1: CGPointMake(109.05, 23.51), controlPoint2: CGPointMake(106.66, 18.11))
        bezierPath.addCurveToPoint(CGPointMake(85.72, 23.96), controlPoint1: CGPointMake(101.45, 14.75), controlPoint2: CGPointMake(91.27, 20.15))
        bezierPath.addCurveToPoint(CGPointMake(50.32, 24.67), controlPoint1: CGPointMake(76.66, 21.21), controlPoint2: CGPointMake(57.51, 21.48))
        bezierPath.addCurveToPoint(CGPointMake(30.07, 16.34), controlPoint1: CGPointMake(37.07, 14.84), controlPoint2: CGPointMake(30.07, 16.34))
        bezierPath.addCurveToPoint(CGPointMake(28.87, 37.07), controlPoint1: CGPointMake(30.07, 16.34), controlPoint2: CGPointMake(25.54, 24.76))
        bezierPath.addCurveToPoint(CGPointMake(21.26, 57.69), controlPoint1: CGPointMake(24.51, 42.83), controlPoint2: CGPointMake(21.26, 46.9))
        bezierPath.addCurveToPoint(CGPointMake(21.68, 65.07), controlPoint1: CGPointMake(21.26, 60.28), controlPoint2: CGPointMake(21.41, 62.72))
        bezierPath.addCurveToPoint(CGPointMake(56.44, 95.87), controlPoint1: CGPointMake(25.43, 85.52), controlPoint2: CGPointMake(41.07, 94.35))
        bezierPath.addCurveToPoint(CGPointMake(50.97, 105.13), controlPoint1: CGPointMake(54.13, 97.69), controlPoint2: CGPointMake(51.35, 101.13))
        bezierPath.addCurveToPoint(CGPointMake(37.67, 106.24), controlPoint1: CGPointMake(48.06, 107.07), controlPoint2: CGPointMake(42.22, 107.72))
        bezierPath.addCurveToPoint(CGPointMake(19.33, 92.95), controlPoint1: CGPointMake(31.31, 104.15), controlPoint2: CGPointMake(28.87, 91.09))
        bezierPath.addCurveToPoint(CGPointMake(19.47, 95.96), controlPoint1: CGPointMake(17.27, 93.35), controlPoint2: CGPointMake(17.68, 94.76))
        bezierPath.addCurveToPoint(CGPointMake(27.22, 105.53), controlPoint1: CGPointMake(22.37, 97.91), controlPoint2: CGPointMake(25.11, 100.34))
        bezierPath.addCurveToPoint(CGPointMake(43.01, 116.64), controlPoint1: CGPointMake(28.84, 109.52), controlPoint2: CGPointMake(32.24, 116.64))
        bezierPath.addCurveToPoint(CGPointMake(50.28, 116.12), controlPoint1: CGPointMake(47.29, 116.64), controlPoint2: CGPointMake(50.28, 116.12))
        bezierPath.addCurveToPoint(CGPointMake(50.37, 130.24), controlPoint1: CGPointMake(50.28, 116.12), controlPoint2: CGPointMake(50.37, 126.28))
        bezierPath.addCurveToPoint(CGPointMake(44.43, 138.27), controlPoint1: CGPointMake(50.37, 134.8), controlPoint2: CGPointMake(44.43, 136.08))
        bezierPath.addCurveToPoint(CGPointMake(47.97, 139.22), controlPoint1: CGPointMake(44.43, 139.14), controlPoint2: CGPointMake(46.39, 139.22))
        bezierPath.addCurveToPoint(CGPointMake(57.59, 131.79), controlPoint1: CGPointMake(51.09, 139.22), controlPoint2: CGPointMake(57.59, 136.53))
        bezierPath.addCurveToPoint(CGPointMake(57.65, 113.15), controlPoint1: CGPointMake(57.59, 128.02), controlPoint2: CGPointMake(57.65, 115.36))
        bezierPath.addCurveToPoint(CGPointMake(60.15, 106.76), controlPoint1: CGPointMake(57.65, 108.3), controlPoint2: CGPointMake(60.15, 106.76))
        bezierPath.addCurveToPoint(CGPointMake(59.55, 136.08), controlPoint1: CGPointMake(60.15, 106.76), controlPoint2: CGPointMake(60.46, 132.61))
        bezierPath.addCurveToPoint(CGPointMake(56.55, 141.39), controlPoint1: CGPointMake(58.48, 140.16), controlPoint2: CGPointMake(56.55, 139.58))
        bezierPath.addCurveToPoint(CGPointMake(66.95, 136.13), controlPoint1: CGPointMake(56.55, 144.1), controlPoint2: CGPointMake(64.36, 142.05))
        bezierPath.addCurveToPoint(CGPointMake(68.06, 106.15), controlPoint1: CGPointMake(68.96, 131.5), controlPoint2: CGPointMake(68.06, 106.15))
        bezierPath.addLineToPoint(CGPointMake(70.15, 106.1))
        bezierPath.addCurveToPoint(CGPointMake(70.1, 123.02), controlPoint1: CGPointMake(70.15, 106.1), controlPoint2: CGPointMake(70.17, 117.71))
        bezierPath.addCurveToPoint(CGPointMake(72.63, 138.73), controlPoint1: CGPointMake(70.03, 128.51), controlPoint2: CGPointMake(69.48, 135.46))
        bezierPath.addCurveToPoint(CGPointMake(81.03, 141.22), controlPoint1: CGPointMake(74.7, 140.89), controlPoint2: CGPointMake(81.03, 144.67))
        bezierPath.addCurveToPoint(CGPointMake(76.59, 132.13), controlPoint1: CGPointMake(81.03, 139.21), controlPoint2: CGPointMake(76.59, 137.56))
        bezierPath.addLineToPoint(CGPointMake(76.59, 107.12))
        bezierPath.addCurveToPoint(CGPointMake(79.85, 115.34), controlPoint1: CGPointMake(79.29, 107.12), controlPoint2: CGPointMake(79.85, 115.34))
        bezierPath.addLineToPoint(CGPointMake(80.82, 130.61))
        bezierPath.addCurveToPoint(CGPointMake(86.63, 138.51), controlPoint1: CGPointMake(80.82, 130.61), controlPoint2: CGPointMake(80.17, 136.19))
        bezierPath.addCurveToPoint(CGPointMake(94.01, 138.17), controlPoint1: CGPointMake(88.91, 139.34), controlPoint2: CGPointMake(93.78, 139.56))
        bezierPath.addCurveToPoint(CGPointMake(88.08, 130.41), controlPoint1: CGPointMake(94.24, 136.78), controlPoint2: CGPointMake(88.14, 134.73))
        bezierPath.addCurveToPoint(CGPointMake(88.19, 114.82), controlPoint1: CGPointMake(88.05, 127.79), controlPoint2: CGPointMake(88.19, 126.25))
        bezierPath.addCurveToPoint(CGPointMake(81.55, 95.81), controlPoint1: CGPointMake(88.19, 103.4), controlPoint2: CGPointMake(86.71, 99.18))
        bezierPath.addCurveToPoint(CGPointMake(114.86, 69.09), controlPoint1: CGPointMake(96.52, 94.22), controlPoint2: CGPointMake(112.06, 87.3))
        bezierPath.closePath()
        bezierPath.miterLimit = 4;
        return bezierPath.CGPath
    }
}
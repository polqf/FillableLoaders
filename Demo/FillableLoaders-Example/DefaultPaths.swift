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
        bezierPath.move(to: CGPoint(x: 190, y: 281))
        bezierPath.addCurve(to: CGPoint(x: 142, y: 329), controlPoint1: CGPoint(x: 163.49, y: 281), controlPoint2: CGPoint(x: 142, y: 302.49))
        bezierPath.addCurve(to: CGPoint(x: 190, y: 377), controlPoint1: CGPoint(x: 142, y: 355.51), controlPoint2: CGPoint(x: 163.49, y: 377))
        bezierPath.addCurve(to: CGPoint(x: 238, y: 329), controlPoint1: CGPoint(x: 216.51, y: 377), controlPoint2: CGPoint(x: 238, y: 355.51))
        bezierPath.addCurve(to: CGPoint(x: 190, y: 281), controlPoint1: CGPoint(x: 238, y: 302.49), controlPoint2: CGPoint(x: 216.51, y: 281))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 209.52, y: 320.32))
        bezierPath.addCurve(to: CGPoint(x: 209.55, y: 321.55), controlPoint1: CGPoint(x: 209.54, y: 320.73), controlPoint2: CGPoint(x: 209.55, y: 321.14))
        bezierPath.addCurve(to: CGPoint(x: 182.65, y: 348.44), controlPoint1: CGPoint(x: 209.55, y: 334.04), controlPoint2: CGPoint(x: 200.04, y: 348.44))
        bezierPath.addCurve(to: CGPoint(x: 168.16, y: 344.2), controlPoint1: CGPoint(x: 177.31, y: 348.44), controlPoint2: CGPoint(x: 172.34, y: 346.88))
        bezierPath.addCurve(to: CGPoint(x: 170.41, y: 344.33), controlPoint1: CGPoint(x: 168.9, y: 344.28), controlPoint2: CGPoint(x: 169.65, y: 344.33))
        bezierPath.addCurve(to: CGPoint(x: 182.16, y: 340.28), controlPoint1: CGPoint(x: 174.84, y: 344.33), controlPoint2: CGPoint(x: 178.92, y: 342.82))
        bezierPath.addCurve(to: CGPoint(x: 173.32, y: 333.72), controlPoint1: CGPoint(x: 178.02, y: 340.21), controlPoint2: CGPoint(x: 174.53, y: 337.47))
        bezierPath.addCurve(to: CGPoint(x: 175.1, y: 333.89), controlPoint1: CGPoint(x: 173.9, y: 333.83), controlPoint2: CGPoint(x: 174.49, y: 333.89))
        bezierPath.addCurve(to: CGPoint(x: 177.59, y: 333.56), controlPoint1: CGPoint(x: 175.96, y: 333.89), controlPoint2: CGPoint(x: 176.8, y: 333.77))
        bezierPath.addCurve(to: CGPoint(x: 170.01, y: 324.28), controlPoint1: CGPoint(x: 173.27, y: 332.69), controlPoint2: CGPoint(x: 170.01, y: 328.87))
        bezierPath.addCurve(to: CGPoint(x: 170.01, y: 324.17), controlPoint1: CGPoint(x: 170.01, y: 324.24), controlPoint2: CGPoint(x: 170.01, y: 324.2))
        bezierPath.addCurve(to: CGPoint(x: 174.29, y: 325.35), controlPoint1: CGPoint(x: 171.28, y: 324.87), controlPoint2: CGPoint(x: 172.74, y: 325.3))
        bezierPath.addCurve(to: CGPoint(x: 170.09, y: 317.48), controlPoint1: CGPoint(x: 171.75, y: 323.65), controlPoint2: CGPoint(x: 170.09, y: 320.76))
        bezierPath.addCurve(to: CGPoint(x: 171.37, y: 312.73), controlPoint1: CGPoint(x: 170.09, y: 315.75), controlPoint2: CGPoint(x: 170.55, y: 314.12))
        bezierPath.addCurve(to: CGPoint(x: 190.85, y: 322.61), controlPoint1: CGPoint(x: 176.03, y: 318.45), controlPoint2: CGPoint(x: 183, y: 322.21))
        bezierPath.addCurve(to: CGPoint(x: 190.61, y: 320.45), controlPoint1: CGPoint(x: 190.69, y: 321.91), controlPoint2: CGPoint(x: 190.61, y: 321.19))
        bezierPath.addCurve(to: CGPoint(x: 200.06, y: 311), controlPoint1: CGPoint(x: 190.61, y: 315.23), controlPoint2: CGPoint(x: 194.84, y: 311))
        bezierPath.addCurve(to: CGPoint(x: 206.96, y: 313.98), controlPoint1: CGPoint(x: 202.78, y: 311), controlPoint2: CGPoint(x: 205.24, y: 312.14))
        bezierPath.addCurve(to: CGPoint(x: 212.97, y: 311.69), controlPoint1: CGPoint(x: 209.12, y: 313.56), controlPoint2: CGPoint(x: 211.14, y: 312.77))
        bezierPath.addCurve(to: CGPoint(x: 208.81, y: 316.92), controlPoint1: CGPoint(x: 212.26, y: 313.89), controlPoint2: CGPoint(x: 210.76, y: 315.75))
        bezierPath.addCurve(to: CGPoint(x: 214.24, y: 315.43), controlPoint1: CGPoint(x: 210.72, y: 316.69), controlPoint2: CGPoint(x: 212.54, y: 316.18))
        bezierPath.addCurve(to: CGPoint(x: 209.52, y: 320.32), controlPoint1: CGPoint(x: 212.97, y: 317.32), controlPoint2: CGPoint(x: 211.37, y: 318.99))
        bezierPath.close()
        bezierPath.miterLimit = 4;
        return bezierPath.cgPath
    }
    
    static func githubPath() -> CGPath {
        //Created with PaintCode
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 114.86, y: 69.09))
        bezierPath.addCurve(to: CGPoint(x: 115.66, y: 59.2), controlPoint1: CGPoint(x: 115.31, y: 66.12), controlPoint2: CGPoint(x: 115.59, y: 62.86))
        bezierPath.addCurve(to: CGPoint(x: 107, y: 35.39), controlPoint1: CGPoint(x: 115.64, y: 43.53), controlPoint2: CGPoint(x: 108.4, y: 37.99))
        bezierPath.addCurve(to: CGPoint(x: 105.55, y: 16.26), controlPoint1: CGPoint(x: 109.05, y: 23.51), controlPoint2: CGPoint(x: 106.66, y: 18.11))
        bezierPath.addCurve(to: CGPoint(x: 85.72, y: 23.96), controlPoint1: CGPoint(x: 101.45, y: 14.75), controlPoint2: CGPoint(x: 91.27, y: 20.15))
        bezierPath.addCurve(to: CGPoint(x: 50.32, y: 24.67), controlPoint1: CGPoint(x: 76.66, y: 21.21), controlPoint2: CGPoint(x: 57.51, y: 21.48))
        bezierPath.addCurve(to: CGPoint(x: 30.07, y: 16.34), controlPoint1: CGPoint(x: 37.07, y: 14.84), controlPoint2: CGPoint(x: 30.07, y: 16.34))
        bezierPath.addCurve(to: CGPoint(x: 28.87, y: 37.07), controlPoint1: CGPoint(x: 30.07, y: 16.34), controlPoint2: CGPoint(x: 25.54, y: 24.76))
        bezierPath.addCurve(to: CGPoint(x: 21.26, y: 57.69), controlPoint1: CGPoint(x: 24.51, y: 42.83), controlPoint2: CGPoint(x: 21.26, y: 46.9))
        bezierPath.addCurve(to: CGPoint(x: 21.68, y: 65.07), controlPoint1: CGPoint(x: 21.26, y: 60.28), controlPoint2: CGPoint(x: 21.41, y: 62.72))
        bezierPath.addCurve(to: CGPoint(x: 56.44, y: 95.87), controlPoint1: CGPoint(x: 25.43, y: 85.52), controlPoint2: CGPoint(x: 41.07, y: 94.35))
        bezierPath.addCurve(to: CGPoint(x: 50.97, y: 105.13), controlPoint1: CGPoint(x: 54.13, y: 97.69), controlPoint2: CGPoint(x: 51.35, y: 101.13))
        bezierPath.addCurve(to: CGPoint(x: 37.67, y: 106.24), controlPoint1: CGPoint(x: 48.06, y: 107.07), controlPoint2: CGPoint(x: 42.22, y: 107.72))
        bezierPath.addCurve(to: CGPoint(x: 19.33, y: 92.95), controlPoint1: CGPoint(x: 31.31, y: 104.15), controlPoint2: CGPoint(x: 28.87, y: 91.09))
        bezierPath.addCurve(to: CGPoint(x: 19.47, y: 95.96), controlPoint1: CGPoint(x: 17.27, y: 93.35), controlPoint2: CGPoint(x: 17.68, y: 94.76))
        bezierPath.addCurve(to: CGPoint(x: 27.22, y: 105.53), controlPoint1: CGPoint(x: 22.37, y: 97.91), controlPoint2: CGPoint(x: 25.11, y: 100.34))
        bezierPath.addCurve(to: CGPoint(x: 43.01, y: 116.64), controlPoint1: CGPoint(x: 28.84, y: 109.52), controlPoint2: CGPoint(x: 32.24, y: 116.64))
        bezierPath.addCurve(to: CGPoint(x: 50.28, y: 116.12), controlPoint1: CGPoint(x: 47.29, y: 116.64), controlPoint2: CGPoint(x: 50.28, y: 116.12))
        bezierPath.addCurve(to: CGPoint(x: 50.37, y: 130.24), controlPoint1: CGPoint(x: 50.28, y: 116.12), controlPoint2: CGPoint(x: 50.37, y: 126.28))
        bezierPath.addCurve(to: CGPoint(x: 44.43, y: 138.27), controlPoint1: CGPoint(x: 50.37, y: 134.8), controlPoint2: CGPoint(x: 44.43, y: 136.08))
        bezierPath.addCurve(to: CGPoint(x: 47.97, y: 139.22), controlPoint1: CGPoint(x: 44.43, y: 139.14), controlPoint2: CGPoint(x: 46.39, y: 139.22))
        bezierPath.addCurve(to: CGPoint(x: 57.59, y: 131.79), controlPoint1: CGPoint(x: 51.09, y: 139.22), controlPoint2: CGPoint(x: 57.59, y: 136.53))
        bezierPath.addCurve(to: CGPoint(x: 57.65, y: 113.15), controlPoint1: CGPoint(x: 57.59, y: 128.02), controlPoint2: CGPoint(x: 57.65, y: 115.36))
        bezierPath.addCurve(to: CGPoint(x: 60.15, y: 106.76), controlPoint1: CGPoint(x: 57.65, y: 108.3), controlPoint2: CGPoint(x: 60.15, y: 106.76))
        bezierPath.addCurve(to: CGPoint(x: 59.55, y: 136.08), controlPoint1: CGPoint(x: 60.15, y: 106.76), controlPoint2: CGPoint(x: 60.46, y: 132.61))
        bezierPath.addCurve(to: CGPoint(x: 56.55, y: 141.39), controlPoint1: CGPoint(x: 58.48, y: 140.16), controlPoint2: CGPoint(x: 56.55, y: 139.58))
        bezierPath.addCurve(to: CGPoint(x: 66.95, y: 136.13), controlPoint1: CGPoint(x: 56.55, y: 144.1), controlPoint2: CGPoint(x: 64.36, y: 142.05))
        bezierPath.addCurve(to: CGPoint(x: 68.06, y: 106.15), controlPoint1: CGPoint(x: 68.96, y: 131.5), controlPoint2: CGPoint(x: 68.06, y: 106.15))
        bezierPath.addLine(to: CGPoint(x: 70.15, y: 106.1))
        bezierPath.addCurve(to: CGPoint(x: 70.1, y: 123.02), controlPoint1: CGPoint(x: 70.15, y: 106.1), controlPoint2: CGPoint(x: 70.17, y: 117.71))
        bezierPath.addCurve(to: CGPoint(x: 72.63, y: 138.73), controlPoint1: CGPoint(x: 70.03, y: 128.51), controlPoint2: CGPoint(x: 69.48, y: 135.46))
        bezierPath.addCurve(to: CGPoint(x: 81.03, y: 141.22), controlPoint1: CGPoint(x: 74.7, y: 140.89), controlPoint2: CGPoint(x: 81.03, y: 144.67))
        bezierPath.addCurve(to: CGPoint(x: 76.59, y: 132.13), controlPoint1: CGPoint(x: 81.03, y: 139.21), controlPoint2: CGPoint(x: 76.59, y: 137.56))
        bezierPath.addLine(to: CGPoint(x: 76.59, y: 107.12))
        bezierPath.addCurve(to: CGPoint(x: 79.85, y: 115.34), controlPoint1: CGPoint(x: 79.29, y: 107.12), controlPoint2: CGPoint(x: 79.85, y: 115.34))
        bezierPath.addLine(to: CGPoint(x: 80.82, y: 130.61))
        bezierPath.addCurve(to: CGPoint(x: 86.63, y: 138.51), controlPoint1: CGPoint(x: 80.82, y: 130.61), controlPoint2: CGPoint(x: 80.17, y: 136.19))
        bezierPath.addCurve(to: CGPoint(x: 94.01, y: 138.17), controlPoint1: CGPoint(x: 88.91, y: 139.34), controlPoint2: CGPoint(x: 93.78, y: 139.56))
        bezierPath.addCurve(to: CGPoint(x: 88.08, y: 130.41), controlPoint1: CGPoint(x: 94.24, y: 136.78), controlPoint2: CGPoint(x: 88.14, y: 134.73))
        bezierPath.addCurve(to: CGPoint(x: 88.19, y: 114.82), controlPoint1: CGPoint(x: 88.05, y: 127.79), controlPoint2: CGPoint(x: 88.19, y: 126.25))
        bezierPath.addCurve(to: CGPoint(x: 81.55, y: 95.81), controlPoint1: CGPoint(x: 88.19, y: 103.4), controlPoint2: CGPoint(x: 86.71, y: 99.18))
        bezierPath.addCurve(to: CGPoint(x: 114.86, y: 69.09), controlPoint1: CGPoint(x: 96.52, y: 94.22), controlPoint2: CGPoint(x: 112.06, y: 87.3))
        bezierPath.close()
        bezierPath.miterLimit = 4;
        return bezierPath.cgPath
    }
}

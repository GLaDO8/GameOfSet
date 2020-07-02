//
//  Squiggle.swift
//  gameOfSet
//
//  Created by shreyas gupta on 02/07/20.
//  Copyright © 2020 shreyas gupta. All rights reserved.
//

import SwiftUI

struct Squiggle: Shape{
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let rightPoint = CGPoint(x: center.x+rect.width/1.8, y: center.y - rect.height/3.5)
        let leftPoint = CGPoint(x: center.x-rect.width/1.8, y: center.y + rect.height/3)
        let controlPointTop1 = CGPoint(x: leftPoint.x + rect.width/2, y: leftPoint.y - rect.height*2)
        let controlPointTop2 = CGPoint(x: rightPoint.x - rect.width/2, y: rightPoint.y + rect.height*1.5)
        let controlPointBottom1 = CGPoint(x: rightPoint.x - rect.width/2, y: rightPoint.y + rect.height*2.25)
        let controlPointBottom2 = CGPoint(x: leftPoint.x + rect.width/2, y: leftPoint.y - rect.height)
       
        var p = Path()
        p.move(to: leftPoint)
        p.addCurve(to: rightPoint, control1: controlPointTop1, control2: controlPointTop2)
        p.addCurve(to: leftPoint, control1: controlPointBottom1, control2: controlPointBottom2)
        return p
    }
    
}

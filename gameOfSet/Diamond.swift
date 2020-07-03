//
//  Diamond.swift
//  gameOfSet
//
//  Created by shreyas gupta on 15/06/20.
//  Copyright © 2020 shreyas gupta. All rights reserved.
//

import SwiftUI

struct Diamond: Shape{
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let startPoint = CGPoint(x: center.x, y: ((center.y)-(rect.height)/2))
        let rightPoint = CGPoint(x: center.x+rect.width/2, y: center.y)
        let bottomPoint = CGPoint(x: center.x, y: ((center.y)+(rect.height)/2))
        let leftPoint = CGPoint(x: center.x-rect.width/2, y: center.y)
        return Path{ path in
            path.move(to: startPoint)
            path.addLine(to: rightPoint)
            path.addLine(to: bottomPoint)
            path.addLine(to: leftPoint)
            path.addLine(to: startPoint)
        }
    }
}

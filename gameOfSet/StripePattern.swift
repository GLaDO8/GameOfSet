//
//  StripePattern.swift
//  gameOfSet
//
//  Created by shreyas gupta on 03/07/20.
//  Copyright © 2020 shreyas gupta. All rights reserved.
//

import SwiftUI

struct StripedPattern: View{
    static let stripeCount = 20
    var body: some View{
        let tempPoint = CGPoint(x: 0, y: 0)
        return GeometryReader{ geometry in
            Group{
                ForEach(0..<StripedPattern.stripeCount){ count in
                    patternLine(startPoint: CGPoint(x: tempPoint.x + CGFloat(5*count), y: tempPoint.y), endPoint: CGPoint(x: tempPoint.x + CGFloat(5*count), y: tempPoint.y + geometry.size.height*1.5))
                }
            }
        }
    }
}

struct patternLine: View{
    let startPoint: CGPoint
    let endPoint: CGPoint
    
    var body: some View{
        Path{ path in
            path.move(to: self.startPoint)
            path.addLine(to: self.endPoint)
        }
        .stroke(lineWidth: 2)
    }
}

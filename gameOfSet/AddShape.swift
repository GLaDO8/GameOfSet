//
//  AddShape.swift
//  gameOfSet
//
//  Created by shreyas gupta on 13/06/20.
//  Copyright © 2020 shreyas gupta. All rights reserved.
//

import SwiftUI

struct AddShape: ViewModifier{
    var shapeType: Model.CardShape
    var shadingType: Double
    var shapeColor: Color
    var size: CGSize
    var noOfShapes: Int
    
    func body(content: Content) -> some View{
        ZStack{
            VStack{
                ForEach(1...noOfShapes, id: \.self){ _ in
                    Group{
                        ZStack{
                            if (self.shapeType == .rectangle){
                                RoundedRectangle(cornerRadius: self.radiusValue)
                                    .fill(self.shapeColor)
                                    .opacity(self.shadingType)
                                RoundedRectangle(cornerRadius: self.radiusValue)
                                    .stroke(lineWidth: self.strokeWidth)
                            }
                            else if (self.shapeType == .oval){
                                Ellipse()
                                    .fill(self.shapeColor)
                                    .opacity(self.shadingType)
                                Ellipse()
                                    .stroke(lineWidth: self.strokeWidth)
                            }
                            else {
                                Diamond()
                                    .fill(self.shapeColor)
                                    .opacity(self.shadingType)
                                Diamond()
                                    .stroke(lineWidth: self.strokeWidth)
                            }
                            
                        }
                    }
                    .frame(width: (self.size.width)/2, height: (self.size.height)/5, alignment: .center)
                    .foregroundColor(self.shapeColor)
                }
            }
            content
        }
    }
    let strokeWidth: CGFloat = 2
    let radiusValue: CGFloat = 8
}

extension View{
    func addShape(shapeType: Model.CardShape, shadingType: Double, shapeColor: Color, size: CGSize, noOfShapes: Int) -> some View{
        return self.modifier(AddShape(shapeType: shapeType, shadingType: shadingType, shapeColor: shapeColor, size: size, noOfShapes: noOfShapes))
    }
}

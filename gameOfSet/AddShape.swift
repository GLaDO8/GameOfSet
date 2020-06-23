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
                                self.shapeMaker(type: RoundedRectangle(cornerRadius: self.radiusValue))
                            }
                            else if (self.shapeType == .oval){
                               self.shapeMaker(type: Ellipse())
                            }
                            else {
                                self.shapeMaker(type: Diamond())
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
    
    func shapeMaker<T: Shape>(type shape: T) -> some View{
        return
            Group{
                shape
                    .fill(self.shapeColor)
                    .opacity(self.shadingType)
                shape
                    .stroke(lineWidth: self.strokeWidth)
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

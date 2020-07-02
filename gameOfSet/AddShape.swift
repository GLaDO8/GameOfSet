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
    var shadingType: Model.CardFill
    var shapeColor: Color
    var size: CGSize
    var noOfShapes: Int
    
    func body(content: Content) -> some View{
        ZStack{
            content
            VStack{
                ForEach(1...noOfShapes, id: \.self){ _ in
                    Group{
                        ZStack{
                            if (self.shapeType == .rectangle){
                                self.shapeMaker(type: RoundedRectangle(cornerRadius: self.radiusValue))
                            }
                            else if (self.shapeType == .squiggle){
                                self.shapeMaker(type: Squiggle())
                            }
                            else {
                                self.shapeMaker(type: Diamond())
                            }
                        }
                    }
                    .frame(width: (self.size.width)/1.8, height: (self.size.height)/5, alignment: .center)
                    .foregroundColor(self.shapeColor)
                }
            }
        }
    }
    
    
    func shapeMaker<T: Shape>(type shape: T) -> some View{
        return
            Group{
                if (self.shadingType == .empty){
                    shape
                        .stroke(lineWidth: self.strokeWidth)
                }
                else if (self.shadingType == .filled){
                    shape
                        .fill(self.shapeColor)
                    shape
                        .stroke(lineWidth: self.strokeWidth)
                }
                else{
                    shape
                        .stroke(lineWidth: self.strokeWidth)
                        .overlay(StripedPattern())
                        .clipShape(shape)
                }
        }
    }
    
    let strokeWidth: CGFloat = 2
    let radiusValue: CGFloat = 24
}

extension View{
    func addShape(shapeType: Model.CardShape, shadingType: Model.CardFill, shapeColor: Color, size: CGSize, noOfShapes: Int) -> some View{
        return self.modifier(AddShape(shapeType: shapeType, shadingType: shadingType, shapeColor: shapeColor, size: size, noOfShapes: noOfShapes))
    }
}

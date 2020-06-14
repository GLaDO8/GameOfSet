//
//  Array+firstIndex.swift
//  gameOfSet
//
//  Created by shreyas gupta on 11/06/20.
//  Copyright © 2020 shreyas gupta. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable{
    func firstIndex(of element: Element) -> Int?{
        for index in 0..<self.count{
            if self[index].id == element.id{
                return index
            }
        }
        return nil
    }
}

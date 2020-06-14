//
//  Grid.swift
//  flippyCards
//
//  Created by shreyas gupta on 31/05/20.
//  Copyright © 2020 shreyas gupta. All rights reserved.
//

import SwiftUI

//identifiable so that the foreach can iterate through it
struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View{
    
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    //Closures are by default function types in swift. This is because the function passed might be used immediately or be called later. To recognise this, we pass in escaping to tell swift that the function will be called later but not immediately, in order to keep it in the heap.
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView){
        self.items = items
        self.viewForItem = viewForItem
    }
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    func body(for layout: GridLayout) -> some View{
        ForEach(items){ item in
            self.body(for: item, in: layout)
        }
    }
    func body(for item: Item, in layout: GridLayout) -> some View{
        let index = items.firstIndex(of: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
}


//
//  Order.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

//i added ObservableObject and @Published to make SceneDelegate work (make order global)
class Favorites : ObservableObject{
    @Published var items = [MenuItem]()

    func add(item: MenuItem) {
        if similarInside(item: item){
            items.append(item)
        }
    }
    
    func similarInside(item: MenuItem) ->Bool {
        var flag: Bool = true
        for it in items{
            if it == item{
                flag=false
            }
        }
        
        return flag
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}

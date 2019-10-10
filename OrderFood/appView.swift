//
//  appView.swift
//  OrderFood
//
//  Created by Kostas Poimenidis on 10/10/19.
//  Copyright © 2019 Kostas Poimenidis. All rights reserved.
//

import SwiftUI

struct appView: View {
    var body: some View {
        TabView{
            ContentView().tabItem{
                Image(systemName: "list.dash")
                Text("Menu")
            }
            
            OrderView().tabItem{
                Image(systemName: "square.and.pencil")
                Text("Order")
            }
        }
    }
}

struct appView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        appView().environmentObject(order)
    }
}

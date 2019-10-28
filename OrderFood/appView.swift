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
            
            FavoriteView().tabItem{
                Image(systemName: "heart")
                Text("Favorites")
            }
            
            LoginChatView().tabItem{
                Image(systemName: "message")
                Text("Chat")
            }
            }
    }
}

struct appView_Previews: PreviewProvider {
    static let order = Order()
    static let favorites = Favorites()
    
    static var previews: some View {
        appView().environmentObject(order).environmentObject(favorites)
    }
}

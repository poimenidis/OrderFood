//
//  ContentView.swift
//  OrderFood
//
//  Created by Kostas Poimenidis on 09/10/2019.
//  Copyright © 2019 Kostas Poimenidis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let list = ["Pick whatever you want!","Choose 'order' to check out"]
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView{
            List {
                ForEach(list, id: \.self) { index in
                    Text(index.description)
                }
                
                //i went to menu.swift and i made menusection Identifiable
                ForEach(menu) { index in
                    Section(header: Text(index.name)){
                        ForEach(index.items){ item in
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

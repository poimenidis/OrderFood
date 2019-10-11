//
//  FavoriteView.swift
//  OrderFood
//
//  Created by Kostas Poimenidis on 11/10/19.
//  Copyright © 2019 Kostas Poimenidis. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        NavigationView{
            VStack{
                if(favorites.items.count>0){
                    List {
                        ForEach(favorites.items){ item in
                            ItemRow(item: item)
                        }.onDelete(perform: deleteItems) //sosara!
                    }
                    
                }
                else{
                    Text("You do not have any favorite item")
                }
            }.navigationBarTitle("Favorites")
            .listStyle(GroupedListStyle())
                .navigationBarItems(trailing: EditButton()) //sosara!! That help me to edit my list
            
        }
    }
    
    //sosara!! a func which deletes a spesific row
    func deleteItems(position : IndexSet){
        favorites.items.remove(atOffsets: position)
    }
    
}

struct FavoriteView_Previews: PreviewProvider {
    static var favorites = Favorites()
    static var previews: some View {
        FavoriteView().environmentObject(favorites)
    }
}

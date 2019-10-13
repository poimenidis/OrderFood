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
    
    static let sort  = ["Name","Price"]
    @State private var sort: Int = 0
    
    var list : [MenuItem]{
        return sorted(sort: sort)
    }

    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Text("Sort favorites by:")
                    Spacer()
                }
                Picker("", selection: $sort.animation()){
                    ForEach(0 ..< Self.sort.count){
                        Text(Self.sort[$0])
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                
                if(favorites.items.count>0){
                    
                    List {
                        ForEach(list){ item in
                            ItemRow(item: item)
                        }.onDelete(perform: deleteItems) //sosara!
                    }
                    
                }
                else{
                    Spacer()
                    Text("You do not have any favorite item")
                    Spacer()
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
    
    func sorted(sort: Int)->[MenuItem]{
        
        if sort == 0{
            return favorites.items.sorted(by: {$0.name<$1.name})
        }
        else{
            return favorites.items.sorted(by: {$0.price<$1.price})
        }
        
    }
    
}

struct FavoriteView_Previews: PreviewProvider {
    static var favorites = Favorites()
    static var previews: some View {
        FavoriteView().environmentObject(favorites)
    }
}



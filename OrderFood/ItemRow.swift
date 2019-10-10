//
//  ItemRow.swift
//  OrderFood
//
//  Created by Kostas Poimenidis on 10/10/19.
//  Copyright © 2019 Kostas Poimenidis. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    let item : MenuItem
    static let colors : [String: Color] = ["D": .purple,"G":.green,"N":.black,"S":.white,"V":.blue]
    
    var body: some View {
        NavigationLink(destination: ItemDetail(item: item)){
            HStack{
                Image(item.thumbnailImage)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.gray,lineWidth:2))
                VStack(alignment: .leading){
                    Text(item.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Text("\(item.price) €")
                        .multilineTextAlignment(.leading)
                }
                
                Spacer()
                
                ForEach(item.restrictions, id:\.self) {res in
                    Text(res)
                        .foregroundColor(Color.white)
                        .padding(5)
                        .background(Self.colors[res])
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.black,lineWidth:2))
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}

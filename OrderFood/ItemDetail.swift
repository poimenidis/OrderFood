//
//  ItemDetail.swift
//  OrderFood
//
//  Created by Kostas Poimenidis on 10/10/19.
//  Copyright © 2019 Kostas Poimenidis. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    //get the global order
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorites: Favorites
    //to make button go back
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    static var numberOfPicks = [1,2,3,4,5]
    @State private var numberOfPicks = 0
    @State private var showAlert = false

    var item : MenuItem
    
    var body: some View {
        NavigationView{
            VStack(){
                Spacer()
                Button(action: {withAnimation {
                    if(self.favorites.similarInside(item: self.item)){
                        self.favorites.add(item: self.item)
                    }
                    else{
                        self.favorites.remove(item: self.item)
                    }
                        
                }}) {
                    if(self.favorites.similarInside(item: self.item)){
                        Image(systemName: "heart")
                    }
                    else{
                        Image(systemName: "heart.fill")
                    }
                }
                Spacer()
                
                ZStack(alignment: .bottomTrailing){
                    
                    Image(item.mainImage)
                    
                    Text("Photo:\(item.photoCredit)")
                        .foregroundColor(Color.white)
                        .padding(6)
                        .font(.caption)
                        .background(Color.black)
                        .offset(x:-5,y:-5)
                }
                
                Text(item.description).multilineTextAlignment(.center).padding()
                
                Section{
                    Picker("How much?",selection: $numberOfPicks){
                        ForEach(0 ..< Self.numberOfPicks.count){
                            Text("\(Self.numberOfPicks[$0])")
                        }
                        }.pickerStyle(WheelPickerStyle()).padding(5)
                }
                
                Button(action: {withAnimation {
                    
                    self.order.add(item: self.item, number: self.numberOfPicks)
                    self.presentationMode.wrappedValue.dismiss()
                    
                }}) {
                  Text("Order This").font(.headline)
                }.alert(isPresented: $showAlert){
                        Alert(title: Text("Order Confirmed"), message: Text("Your total was \(order.total)€ \n Thank you"),
                              dismissButton: .default(Text("OK")))
                }
                
                Spacer()
                
//                Button("Order This"){
//                    self.order.add(item: self.item)
//
//                }.font(.headline)
                
            }
            .navigationBarTitle(Text(item.name),displayMode: .inline)
            
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    
    static let order = Order()
    static var favorites = Favorites()
    
    static var previews: some View {
        ItemDetail(item : MenuItem.example).environmentObject(order).environmentObject(favorites)
    }
}

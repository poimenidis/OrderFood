//
//  OrderView.swift
//  OrderFood
//
//  Created by Kostas Poimenidis on 10/10/19.
//  Copyright © 2019 Kostas Poimenidis. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView{
            List{
                Section{
                    ForEach(order.items){ item in
                        HStack{
                            Text(item.name)
                            Spacer()
                            Text("\(item.price)€")
                        }
                    }.onDelete(perform: deleteItems) //sosara!
                }
                
                if(order.items.count>0){
                    Section{
                        NavigationLink(destination:CheckOutView()){
                          Text("Place Order")
                        }
                    }
                }
                else{
                    Text("You have not ordered something yet...")
                }
                
                
                }.navigationBarTitle("Order")
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton()) //sosara!! That help me to edit my list
        }
    }
    
    //sosara!! a func which deletes a spesific row
    func deleteItems(position : IndexSet){
        order.items.remove(atOffsets: position)
    }
    
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        OrderView().environmentObject(self.order)
    }
}

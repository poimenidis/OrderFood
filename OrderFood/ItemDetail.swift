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
    //to make button go back
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var showToast: Bool = false


    var item : MenuItem
    
    var body: some View {
        NavigationView{
            VStack(){
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
                
                Button(action: {withAnimation {
                    self.order.add(item: self.item)
                    self.presentationMode.wrappedValue.dismiss()
                    }}) {
                  Text("Order This").font(.headline)
                }
                
//                Button("Order This"){
//                    self.order.add(item: self.item)
//
//                }.font(.headline)
                
                Spacer()
            }
            .navigationBarTitle(Text(item.name),displayMode: .inline)
            
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    
    static let order = Order()
    
    static var previews: some View {
        ItemDetail(item : MenuItem.example).environmentObject(order)
    }
}


struct Toast<Presenting>: View where Presenting: View {

    /// The binding that decides the appropriate drawing in the body.
    @Binding var isShowing: Bool
    /// The view that will be "presenting" this toast
    let presenting: () -> Presenting
    /// The text to show
    let text: Text

    var body: some View {

        GeometryReader { geometry in

            ZStack(alignment: .center) {

                self.presenting()
                    .blur(radius: self.isShowing ? 1 : 0)

                VStack {
                    self.text
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .transition(.slide)
                .opacity(self.isShowing ? 1 : 0)

            }

        }

    }

}

extension View {

    func toast(isShowing: Binding<Bool>, text: Text) -> some View {
        Toast(isShowing: isShowing,
              presenting: { self },
              text: text)
    }

}

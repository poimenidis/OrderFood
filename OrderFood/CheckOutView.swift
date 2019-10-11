//
//  CheckOutView.swift
//  OrderFood
//
//  Created by Kostas Poimenidis on 10/10/19.
//  Copyright © 2019 Kostas Poimenidis. All rights reserved.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order : Order
    //to make button go back
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    static let paymentType = ["Cash", "Credit Card","BitCoins"]
//    static let tip = ["10%","15%","20%","25%","0%"]
    //here with @State i set some values that my my variables will have by default
    @State private var paymentType = 1
    @State private var tip = 1
    @State private var credit = false
    @State private var creditNumber:String = ""
    @State private var showAlert:Bool = false
    @State private var showAlertErr:Bool = false

    
    var totalPrice : Double{
        let total = Double(order.total)
        return total
    }
    
    
    
    var body: some View {
        Form{
            Section{
                Picker("How do you want pay?", selection: $paymentType.animation()){
                    ForEach(0 ..< Self.paymentType.count){
                        Text(Self.paymentType[$0])
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section{
                if self.paymentType == 1{
                    Toggle(isOn: $credit.animation()){
                        Text("Add your credit card number")
                    }
                    if credit{
                        TextField("Type your credit card number", text: $creditNumber)
                            .padding(5)
                    }
                }
            }
            
//            Section(header: Text("Add Tip?")){
//                Picker("%",selection: $tip){
//                    ForEach(0 ..< Self.tip.count){
//                        Text(Self.tip[$0])
//                    }
//                }
//            }
            
            Section(header:Text("TOTAL: \(self.totalPrice, specifier:"%.2f")€")){
                Button(action: {withAnimation {
                    
                    if self.paymentType == 1 && !(self.creditNumber==""){
                        self.showAlert = true
                    }
                    else if self.paymentType != 1{
                        self.showAlert = true
                    }
                    else{
                        self.showAlertErr = true
                    }
                    
                }
                    
                }) {
                    Text("Confirm order").font(.headline).multilineTextAlignment(.leading)
                }.alert(isPresented: $showAlertErr){
                    Alert(title: Text("ERROR"), message: Text("You have to enter your Credit Card number"),dismissButton: .default(Text("OK")))
                }
            }.font(.largeTitle)
            
        }.navigationBarTitle(Text("Payment"),displayMode: .inline)
            .alert(isPresented: $showAlert){
                Alert(title: Text("Order Confirmed"),
                      message: Text("Your total was \(self.totalPrice, specifier:"%.2f")€ \n Thank you"),
                      dismissButton: .destructive(Text("OK")) {
                      self.deleteItems()
                        })
        }
    }
    
    func deleteItems(){
        order.items.removeAll()
        self.presentationMode.wrappedValue.dismiss()
    }
    
}

struct CheckOutView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        CheckOutView().environmentObject(order)
    }
}

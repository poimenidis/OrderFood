//
//  MessageRow.swift
//  OrderFood
//
//  Created by Kostas Poimenidis on 29/10/19.
//  Copyright © 2019 Kostas Poimenidis. All rights reserved.
//

import SwiftUI

struct MessageRow: View {
    var msg = ""
    var name = ""
    var userName = ""
    var id =  ""
    

    
    var body: some View {
        HStack{
                
            if self.name == self.userName{
                Spacer()
                VStack{
                   HStack(spacing:30){
                    Spacer()
                    Text(self.id).font(.system(size: 10))
                    Text(self.name).foregroundColor(Color.black).font(.system(size: 14))
                    }
                   HStack{
                    Spacer()
                    Text(self.msg).padding().background(Color.blue).cornerRadius(20).shadow(radius: 2).foregroundColor(Color.white)
                    }
                }
            }
            else{
                VStack{
                    HStack(spacing:30){
                        Text(self.name).frame(alignment: .leading).font(.system(size: 14))
                        Text(self.id).font(.system(size: 10))
                        Spacer()
                    }
                    HStack{
                    Text(self.msg).padding().background(Color("ColorMessage")).cornerRadius(20).shadow(radius: 2).foregroundColor(Color.black).frame(alignment: .leading)
                        Spacer()
                    }
                }
                Spacer()
            }
            
        }
    }
}

struct MessageRow_Previews: PreviewProvider {
    var msg = ""
    var name = ""
    var userName = ""
    static var previews: some View {
        MessageRow(msg:"",name:"",userName: "", id : "")
    }
}

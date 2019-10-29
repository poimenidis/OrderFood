//
//  Chat.swift
//  OrderFood
//
//  Created by Kostas Poimenidis on 28/10/19.
//  Copyright © 2019 Kostas Poimenidis. All rights reserved.
//

import SwiftUI

struct LoginChatView: View {
    
    @State var name = ""
    
    var body: some View {
        
        NavigationView{
            ZStack{
                
                Color.orange
                
                VStack{
                    Image(systemName: "person.circle.fill").resizable().frame(width:60,height: 60)
                    TextField("Your name...",text: $name).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                    
                    if self.name != "" {
                        NavigationLink(destination: ChatView(name: self.name)){
                            HStack{
                                Text("Join")
                                Image(systemName: "play.fill")
                            }
                        }.padding(15).background(Color.orange).foregroundColor(Color.white).cornerRadius(27)
                    }
                    
                    }.padding().background(Color.white).cornerRadius(20)
                
                }.edgesIgnoringSafeArea(.top)
        }.animation(.default)
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        LoginChatView()
    }
}



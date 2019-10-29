//
//  ChatView.swift
//  OrderFood
//
//  Created by Kostas Poimenidis on 28/10/19.
//  Copyright © 2019 Kostas Poimenidis. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseDatabase

struct ChatView: View {
    
    var name = ""
    @ObservedObject var message = observer()
    @State var yourMessage = ""
    
    var body: some View {
        
        VStack{
            VStack{
                List{
                    ForEach(message.messages) { i in
                    
                        MessageRow(msg: i.message, name: i.name, userName: self.name, id: i.id)
                        
                    }
                    
                }.navigationBarTitle("Chat", displayMode: .large)
                .listStyle(PlainListStyle())
                
                HStack{
                        TextField("Type your message...", text: $yourMessage).textFieldStyle(RoundedBorderTextFieldStyle())
                        Button(action: {
                            self.message.addMessage(name: self.name, msg: self.yourMessage)
                            self.yourMessage = ""
                            
                        }){
                            Image(systemName: "paperplane").padding()
                        }
                    }.padding().cornerRadius(25).shadow(radius: 5)
            }
            
        }
    }
    
}

struct ChatView_Previews: PreviewProvider {
    
    var name : String
    
    static var previews: some View {
        ChatView(name: "name")
    }
}

//here is where app reads from firebase
class observer : ObservableObject{
    @Published var messages = [datatype]()
    
    init(){
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.child("messages").observe(.value, with: { (snapshot) in
            
            for child in snapshot.children {
                
                var flag = true
                
                let snap = child as! DataSnapshot
                let value = snap.value as? NSDictionary
                
                let message = value?["message"] as? String ?? ""
                let id = value?["id"] as? String ?? ""
                let name = value?["name"] as? String ?? ""
                
                for index in self.messages{
                    if index.id == id{
                        flag = false
                    }
                }
                
                if flag{
                    self.messages.append(datatype(id: id, name: name, message: message))
                }
            }

           
          // ...
          }) { (error) in
                print(error.localizedDescription)
            }
        
    }
    
    func addMessage(name: String, msg: String){

        let id = getTodayString()
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.child("messages").child(id).setValue(["message":msg,"name":name, "id": id])
        
    }
    
    func getTodayString() -> String{

            let date = Date()
            let calender = Calendar.current
            let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)

            let year = components.year
            let month = components.month
            let day = components.day
            let hour = components.hour
            let minute = components.minute
            let second = components.second

            let today_string = String(year!) + "-" + String(month!) + "-" + String(day!) + " " + String(hour!)  + ":" + String(minute!) + ":" +  String(second!)

            return today_string

        }
}

struct datatype  : Identifiable{
    
    var id : String
    var name : String
    var message : String
    
    
}

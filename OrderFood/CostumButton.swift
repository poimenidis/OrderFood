//
//  CostumButton.swift
//  OrderFood
//
//  Created by Kostas Poimenidis on 12/10/19.
//  Copyright © 2019 Kostas Poimenidis. All rights reserved.
//

import SwiftUI

struct CostumButton<Whatever: View> : View{
    
    let action: ()->Void
    let content: Whatever
    
    init(action: @escaping ()-> Void, content: () -> Whatever){
        self.action = action
        self.content = content()
    }
    
    var body: some View{
        Button(action: action){
            content
            .padding()
                .frame(minWidth:0, maxWidth: .infinity)
                .background(Capsule().fill(Color.gray))
                .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(color:.gray,radius: 5,y: 5)
        }
    }
    
}

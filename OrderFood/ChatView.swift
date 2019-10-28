//
//  ChatView.swift
//  OrderFood
//
//  Created by Kostas Poimenidis on 28/10/19.
//  Copyright © 2019 Kostas Poimenidis. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    
    var name = ""
    var body: some View {
        Text(name)
    }
}

struct ChatView_Previews: PreviewProvider {
    
    var name : String
    
    static var previews: some View {
        ChatView(name: "name")
    }
}

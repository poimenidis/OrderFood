//
//  SignIn.swift
//  OrderFood
//
//  Created by Kostas Poimenidis on 13/10/19.
//  Copyright © 2019 Kostas Poimenidis. All rights reserved.
//

import SwiftUI

struct SignIn: View {
    var body: some View {

        NavigationView{
            NavigationLink(destination: appView()){
                Text("Sign-In")
            }
        }
        
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}

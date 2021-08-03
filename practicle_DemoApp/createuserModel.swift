//
//  userModel.swift
//  practicle_DemoApp
//
//  Created by Ashish Raval on 03/08/21.
//

import SwiftUI

struct createuserModel: Codable {
    
    let username: String
    let emailid: String

    init(strusername: String, stremailid: String){
        self.username = strusername
        self.emailid = stremailid
    }
}


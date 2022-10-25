//
//  globalusernamebs.swift
//  golden3
//
//  Created by Everette, Nathan (Student) on 10/24/22.
//

import SwiftUI
import Firebase
class BS_Username{
    
    var name: String
    init(name: String){
        self.name = name
    }
}
var mainInstance = BS_Username(name: "no username")
var globalImage:UIImage? = nil

//
//  MyConstant.swift
//  UngServiceTurbo
//
//  Created by MasterUNG on 21/2/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import Foundation

class MyConstant {
    
    func getURLaddUser(name: String, user: String, password: String) -> String {
        let result: String = "https://www.androidthai.in.th/turbo/addUserMaster.php?isAdd=true&Name=\(name)&User=\(user)&Password=\(password)"
        return result
    }
    
    func getURLgetUserWhereUser(user: String) -> String {
        return "https://www.androidthai.in.th/turbo/getUserWhereUserMaster.php?isAdd=true&User=\(user)"
    }
    
    
}

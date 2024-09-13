//
//  Person.swift
//  uyuSleep
//
//  Created by Berke Kesgin on 13.09.2024.
//

import Foundation

struct Person {
    
    var name: String
    var surName: String
    var phoneNumber: Int
    var birthday: Date = Date()
    
    // tc veya passport gerekli
    // herhangi bir tanesi gerekli olmayabilir!
    var tc: Int?
    var passportNumber: Int?
    
}

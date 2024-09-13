//
//  PersonInfoViewModel.swift
//  uyuSleep
//
//  Created by Berke Kesgin on 12.09.2024.
//

import Foundation

class PersonInfoViewModel: ObservableObject {
    
    @Published var personData = Person(name: "", surName: "", phoneNumber: 0, tc: 0, passportNumber: 0)
    
    public func phoneNumberFormatter(phoneNumber: String){
        
        if let pesonNumber = Int(phoneNumber){
            personData.phoneNumber = pesonNumber
        }else{
            print("personNumber int gelmedi veya nil")
        }
        
                
        
    }
    
    
    
}

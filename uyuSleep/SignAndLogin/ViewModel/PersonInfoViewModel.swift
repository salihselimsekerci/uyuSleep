//
//  PersonInfoViewModel.swift
//  uyuSleep
//
//  Created by Berke Kesgin on 12.09.2024.
//

import Foundation

class PersonInfoViewModel: ObservableObject {
    
    @Published var personData = Person(name: "", surName: "", phoneNumber: 0, tc: 0, passportNumber: 0)
    
    
    /// Telefon numarasını String olarak alır ve `Int`'e dönüştürerek `personData`'ya kaydeder.
    /// - Parameter phoneNumber: String formatında girilen telefon numarası.
    public func phoneNumberFormatter(phoneNumber: String){
        if let pesonNumber = Int(phoneNumber){
            personData.phoneNumber = pesonNumber
        }else{
            print("personNumber int gelmedi veya nil")
        }
    }
    
    /// Kullanıcı ismini String olarak alır ve `personData`'ya kaydeder
    /// - Parameter name: String formatında girilen isim bilgisirdir.
    public func nameFormatter(name: String){
        personData.name = name
    }
    
    /// Kullanıcı soy ismini String olarak alır ve `personData`'ya kaydeder
    /// - Parameter surName: String formatında girilen soy isimdir.
    public func surNameFormatter(surName: String){
        personData.surName = surName
    }
    
    
}

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
    
    /// Kullanıcın ismini String olarak alır ve `personData`'ya kaydeder
    /// - Parameter name: String formatında girilen isim bilgisirdir.
    public func nameFormatter(name: String){
        personData.name = name
    }
    
    /// Kullanıcın soy ismini String olarak alır ve `personData`'ya kaydeder
    /// - Parameter surName: String formatında girilen soy isimdir.
    public func surNameFormatter(surName: String){
        personData.surName = surName
    }
    
    /// Kullanıcın tc numarasını String olarak alır ve `personData`'ya kaydeder
    /// - Parameter tc: String formatında girilen tc numarasıdır.
    public func tcFormatter(tc: String){
        if let tcNumber = Int(tc){
            personData.tc = tcNumber
        }else{
            print("tc number int gelmedi veya nil")
        }
    }
    
    /// Kullanıcının Pasaport numarasını string olarak alır ve `personData`' ya kaydeder
    /// - Parameter passport: String formatında girilen passport numarasıdır.
    public func passportFormatter(passport: String){
        if let passportNumber = Int(passport){
            personData.passportNumber = passportNumber
        }else{
            print("passport int gelmedi veya nil")
        }
    }
    
}

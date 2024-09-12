
//
//  Constants.swift
//  uyuSleep
//
//  Created by Berke Kesgin on 12.09.2024.
//

import SwiftUI

struct Constants {
    
    //MARK: - Image Sizes
    
    /// Logo'nun ekran genişliğinin %50'si kadar boyutlanması için kullanılan oran
    /// Ekranın genişliği 1000 pt ise, logo 500 pt genişliğinde olur
    static let logoSizeRatio: CGFloat = 0.5
    
    //MARK: - Button
    
    /// Butonun ekran genişliğinin %80'i kadar genişlikte olmasını sağlar
    /// Ekranın genişliği 1000 pt ise, buton 800 pt genişliğinde olur
    static let buttonWidthRatio: CGFloat = 0.8
    
    /// Buton köşelerinin yuvarlatılma miktarı (radius)
    /// Köşe yarıçapı 15 pt olarak ayarlanır
    static let buttonCornerRadius: CGFloat = 15
    
    //MARK: - Spacing
    
    /// Dikey boşluk miktarını belirler
    /// Boşluk 15 pt olarak ayarlanır
    static let verticalSpacing: CGFloat = 15
    
    //MARK: - Colors
    
    /// Butonun arka plan rengini siyah yapar
    /// Arka plan rengi .black
    static let buttonBackgroundColor: Color = .black
    
    /// Buton üzerindeki metnin rengini beyaz yapar
    /// Metin rengi .white
    static let buttonTextColor: Color = .white
    
    //MARK: - Logo
    
    /// App logosu
    /// Black
    static let blackLogo: String = "uyuLogoBlack"
    
    /// App logosu
    /// White
    static let whiteLogo: String = "uyuLogoWhite"
    
    //MARK: - Text
    
    /// Sign Up button yazısı
    /// ÜYE OL
    static let signUpButtonText: String = "ÜYE OL"
    
    /// Log In button yazısı
    /// GİRİŞ YAP
    static let logInButtonText: String = "GİRİŞ YAP"

}

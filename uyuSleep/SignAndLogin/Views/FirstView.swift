//
//  FirstView.swift
//  uyuSleep
//
//  Created by Berke Kesgin on 12.09.2024.
//

import SwiftUI

struct FirstView: View {
    
    // MARK: - Properties
    @State private var showSignUp = false
    @State private var showLogIn = false
    
    // MARK: - View
    
    var body: some View {
        NavigationStack {
            VStack(spacing: Constants.verticalSpacing) {
                Image(Constants.blackLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * Constants.logoSizeRatio, height: UIScreen.main.bounds.width * Constants.logoSizeRatio)
                    .padding()
                
                Button(action: {
                    showSignUp = true
                }) {
                    Text(Constants.signUpButtonText)
                        .frame(width: UIScreen.main.bounds.width * Constants.buttonWidthRatio)
                        .padding()
                        .background(Constants.buttonBackgroundColor)
                        .foregroundColor(Constants.buttonTextColor)
                        .cornerRadius(Constants.buttonCornerRadius)
                }
                .padding(.horizontal)
                
                Button(action: {
                    showLogIn = true
                }) {
                    Text(Constants.logInButtonText)
                        .frame(width: UIScreen.main.bounds.width * Constants.buttonWidthRatio)
                        .padding()
                        .background(Constants.buttonBackgroundColor)
                        .foregroundColor(Constants.buttonTextColor)
                        .cornerRadius(Constants.buttonCornerRadius)
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .fullScreenCover(isPresented: $showSignUp) {
                SignUpWithPhoneView()
            }
            .fullScreenCover(isPresented: $showLogIn) {
                SignUpWithPhoneView() 
            }
        }
    }
    
    // MARK: - Functions
    
    /// Kullanıcıyı kaydetmek için kullanılacak fonksiyon
    private func signUpButton() {
        showSignUp = true
    }
    
    /// Kullanıcıyı giriş yapmak için kullanılacak fonksiyon
    private func logInButton() {
        showLogIn = true
    }
}

#Preview {
    FirstView()
}

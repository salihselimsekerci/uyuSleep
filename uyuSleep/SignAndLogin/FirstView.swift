//
//  FirstView.swift
//  uyuSleep
//
//  Created by Berke Kesgin on 12.09.2024.
//
import SwiftUI

struct FirstView: View {
    
    // MARK: - Properties
    
    // MARK: - View
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: Constants.verticalSpacing) {
                Image(Constants.blackLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * Constants.logoSizeRatio, height: geometry.size.width * Constants.logoSizeRatio)
                    .padding()
                
                Button(action: {
                    // signUpButton()
                }) {
                    Text(Constants.signUpButtonText)
                        .frame(width: geometry.size.width * Constants.buttonWidthRatio)
                        .padding()
                        .background(Constants.buttonBackgroundColor)
                        .foregroundColor(Constants.buttonTextColor)
                        .cornerRadius(Constants.buttonCornerRadius)
                }
                .padding(.horizontal)
                
                Button(action: {
                    // logInButton()
                }) {
                    Text(Constants.logInButtonText)
                        .frame(width: geometry.size.width * Constants.buttonWidthRatio)
                        .padding()
                        .background(Constants.buttonBackgroundColor)
                        .foregroundColor(Constants.buttonTextColor)
                        .cornerRadius(Constants.buttonCornerRadius)
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
    }
    
    // MARK: - Functions
    
    
}

#Preview {
    FirstView()
}

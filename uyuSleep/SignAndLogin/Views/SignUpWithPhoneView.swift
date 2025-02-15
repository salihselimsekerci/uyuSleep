//
//  SignUpWithPhoneView.swift
//  uyuSleep
//
//  Created by Berke Kesgin on 12.09.2024.
//

import SwiftUI

struct SignUpWithPhoneView: View {
    
    //MARK: - Properties
    
    @StateObject private var signUpWithPhoneVM = SignUpWithPhoneViewModel()
    
    @StateObject private var personInfoVM = PersonInfoViewModel()

    @State private var phoneNumber: String = ""
    @State private var smsPassword: String = ""

    @State private var isNumberSuccess: Bool = false
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    @State private var showPersonInfoView: Bool = false
    
    //MARK: - View
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                TextField("Telefon Numarası giriniz", text: $phoneNumber)
                    .padding()
                    .background(Constants.textFieldBackgorundColor)
                    .cornerRadius(10)
                    .keyboardType(.phonePad)
                    .padding(.horizontal)
                    .opacity(isNumberSuccess ? 0.5 : 1.0)
                    .disabled(isNumberSuccess)
                
                if isNumberSuccess {
                    TextField("SMS Kodunu Giriniz", text: $smsPassword)
                        .padding()
                        .background(Constants.textFieldBackgorundColor)
                        .cornerRadius(Constants.buttonCornerRadius)
                        .keyboardType(.numberPad)
                        .padding(.horizontal)
                }
                
                Button(action: {
                    signUpWithPhone()
                }) {
                    Text("Kaydol")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Constants.buttonBackgroundColor)
                        .foregroundColor(.white)
                        .cornerRadius(Constants.buttonCornerRadius)
                }
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    Text("Bir Sorun Var İse Tıklayınız")
                        .font(.footnote)
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                        .padding(.trailing, 20)
                }
                Spacer()
            }
            .padding(.top, 50)
            .navigationBarTitle("Telefon ile Giriş", displayMode: .large)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Hata"), message: Text(alertMessage), dismissButton: .default(Text("Tamam")))
            }
            .fullScreenCover(isPresented: $showPersonInfoView) {
                PersonInfoView()
            }
        }
        .navigationBarBackButtonHidden(true)
        
        // ok yönleri ile sayfa geçişleri için
        RegistrationProgressView(selectedIndex: 0)
        
    }
    
    //MARK: - Functions
    
    private func signUpWithPhone() {
        guard !phoneNumber.isEmpty else {
            alertMessage = "Telefon Numarası boş olamaz."
            showAlert = true
            return
        }
        
        signUpWithPhoneVM.signUpPhoneNumber(phoneNumber: phoneNumber) { success in
            if success {
                personInfoVM.phoneNumberFormatter(phoneNumber: phoneNumber)
                isNumberSuccess = true
                smsPasswordCheck()
            }else{
                alertMessage = "Telefon numarası doğrulama başarısız."
                showAlert = true
            }
        }
    }
    
    private func smsPasswordCheck(){
        if let smsPasswordInt = Int(smsPassword){
            signUpWithPhoneVM.smsPasswordForSignUp(smsPassword: smsPasswordInt) { success in
                if success{
                    // ARTIK KULLANICI GİRİŞ YAPTI
                    // DİĞER SAYFAYA YÖNLENDİR
                    showPersonInfoView = true
                }else {
                    alertMessage = "SMS Kodu Yanlış"
                    showAlert = true
                }
            }
        }
    }
    
}

#Preview {
    SignUpWithPhoneView()
}

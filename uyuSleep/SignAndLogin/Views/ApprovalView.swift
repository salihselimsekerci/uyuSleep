//
//  ApprovalView.swift
//  uyuSleep
//
//  Created by Berke Kesgin on 12.09.2024.
//

import SwiftUI

struct ApprovalView: View {
    
    //MARK: - Properties
    
    @State private var tcNumber: String = ""
    @State private var passportNumber: String = ""
    
    @State private var isKVKKOn: Bool = false
    @State private var isCampaignOn: Bool = false
    @State private var isAgreementOn: Bool = false
    
    @State private var isButtonEnabled: Bool = false

    //MARK: - View
    
    var body: some View {

        VStack() {
            
            TextField("Tc Giriniz", text: $tcNumber)
                .padding()
                .background(Constants.textFieldBackgorundColor)
                .cornerRadius(Constants.buttonCornerRadius)
                .padding(.horizontal)

            TextField("Passport No", text: $passportNumber)
                .padding()
                .background(Constants.textFieldBackgorundColor)
                .cornerRadius(Constants.buttonCornerRadius)
                .padding(.horizontal)


            VStack(alignment: .leading){
                // KVKK toggle
                HStack {
                    Toggle(isOn: $isKVKKOn) {
                        Text("KVKK ")
                            .font(.callout)
                            .padding()
                    }
                    .toggleStyle(SwitchToggleStyle())
                    .onChange(of: isKVKKOn) { _ in
                        checkAllToggles()
                        }
                    Spacer()                }
                    }
                .frame(maxWidth: .infinity, alignment: .leading)

                // Kampanya toggle
                HStack {
                    Toggle(isOn: $isCampaignOn) {
                        Text("Kampanyalardan haberdar olmak istiyorum")
                            .font(.callout)
                            .padding()
                    }
                    .toggleStyle(SwitchToggleStyle())
                    .onChange(of: isCampaignOn) { _ in
                        checkAllToggles()
                    }

                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // Kabul toggle
                HStack {
                    Toggle(isOn: $isAgreementOn) {
                        Text("Ürün ve hizmet anlaşmalarını onaylıyorum")
                            .font(.callout)
                            .padding()
                    }
                    .toggleStyle(SwitchToggleStyle())
                    .onChange(of: isAgreementOn) { _ in
                        checkAllToggles()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
   
            Button(action: {
                goToMainView()
            }) {
                Text("HADİ BAŞLAYALIM")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isButtonEnabled ? Constants.buttonBackgroundColor : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(Constants.buttonCornerRadius)
            }
            .padding()
            .disabled(!isButtonEnabled)
            
            // ok yönleri ile sayfa geçişleri için
            HStack{
                // birinci ok
                VStack{
                    Button(action: {
                        // Birinci ok
                        print("Birinci ok tıklandı")
                    }) {
                        Image(systemName: "arrow.left")
                            .padding()
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            
                    }
                }
                .padding()
                .font(.largeTitle)
                
                // ortaya alan
                RectangleView()
                
                // ikinci ok
                VStack{
                    Button(action: {
                        // İkinci ok
                        print("İkinci ok tıklandı")
                    }) {
                        Image(systemName: "arrow.right")
                            .padding()
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .hidden()
                    }
                }
                
                .padding()
                .font(.largeTitle)
            }

        }
        
    //MARK: - Functions
 
    private func goToMainView(){
        print("--->>> goToMainView func çalıştı")
        //TODO: - Main Sayfaya Geç
    }

    func checkAllToggles() {
        if isKVKKOn && isCampaignOn && isAgreementOn {
            print("All toggles are ON")
            isButtonEnabled = true
        } else {
            print("All toggles are NOT ON")
        }
    }

}
    



#Preview {
    ApprovalView()
}

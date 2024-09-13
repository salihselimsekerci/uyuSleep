//
//  personInfoView.swift
//  uyuSleep
//
//  Created by Berke Kesgin on 12.09.2024.
//

import SwiftUI

struct PersonInfoView: View {
    
    // MARK: - Properties
    @StateObject private var personInfoVM = PersonInfoViewModel()
    
    @State private var nameText: String = ""
    @State private var surNameText: String = ""
    
    @State private var selectedDate = Date()
    @State private var isFormValid: Bool = false
    @State private var navigateToApprovalView = false


    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
    // MARK: - View
    var body: some View {
        NavigationStack {
            VStack(spacing: Constants.verticalSpacing) {
                TextField("İsim Giriniz", text: $nameText)
                    .padding()
                    .background(Constants.textFieldBackgorundColor)
                    .cornerRadius(Constants.buttonCornerRadius)
                    .padding(.horizontal)
                    .onChange(of: nameText) { _ in goToApprovalView() }

            
                TextField("Soy İsim Giriniz", text: $surNameText)
                    .padding()
                    .background(Constants.textFieldBackgorundColor)
                    .cornerRadius(Constants.buttonCornerRadius)
                    .padding(.horizontal)
                    .onChange(of: surNameText) { _ in goToApprovalView() }

                Text("Doğum Tarihi Giriniz")
                    .padding(.top)
                
                GeometryReader { geometry in
                    DatePicker(
                        "",
                        selection: $selectedDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(WheelDatePickerStyle())
                    .frame(width: geometry.size.width * 0.9)
                    .padding(.horizontal, (geometry.size.width * 0.1) / 2)
                }
                .frame(height: 200)
                .padding(.horizontal)
                
                Text("Selected date: \(selectedDate, formatter: dateFormatter)")
                    .padding()
                
                // Ok yönleri ile sayfa geçişleri için
                HStack {
                    // Birinci ok: Geri sayfa
                    VStack {
                        NavigationLink(destination: SignUpWithPhoneView()) {
                            Image(systemName: "arrow.left")
                                .padding()
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    .font(.largeTitle)
                    
                    // Ortaya alan
                    RectangleView()
                    
                    // İkinci ok: İleri sayfa
                    VStack {
                        if isFormValid {
                            NavigationLink(destination: ApprovalView(), isActive: $navigateToApprovalView) {
                                Image(systemName: "arrow.right")
                                    .padding()
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                            }
                        } else {
                            Image(systemName: "arrow.right")
                                .padding()
                                .font(.largeTitle)
                                .foregroundColor(.gray) // Geçiş yapılamaz olduğunda gri
                        }
                    }
                    .padding()
                    .font(.largeTitle)
                }
                
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // MARK: - Functions
    
    /// İsim, Soiyisim ve doğum tarihi girildiği zaman diğer sayfaya geçiş izni verir
    private func goToApprovalView(){
        // Form doğrulama işlemleri
        if !nameText.isEmpty && !surNameText.isEmpty {
            isFormValid = true
        } else {
            isFormValid = false
        }
    }

    /// PersonData'ya verileri kaydetmek için tetiklenen fonksiyon
    private func handleNextAction() {
        personInfoVM.nameFormatter(name: nameText)
        personInfoVM.surNameFormatter(surName: surNameText)
    }

}



#Preview {
    PersonInfoView()
}

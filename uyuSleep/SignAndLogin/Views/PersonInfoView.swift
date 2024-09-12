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
    
    // MARK: - View
    var body: some View {
        NavigationStack {
            VStack(spacing: Constants.verticalSpacing) {
                TextField("İsim Giriniz", text: $nameText)
                    .padding()
                    .background(Constants.textFieldBackgorundColor)
                    .cornerRadius(Constants.buttonCornerRadius)
                    .padding(.horizontal)
            
                TextField("Soy İsim Giriniz", text: $surNameText)
                    .padding()
                    .background(Constants.textFieldBackgorundColor)
                    .cornerRadius(Constants.buttonCornerRadius)
                    .padding(.horizontal)
                
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
                        NavigationLink(destination: ApprovalView()) {
                            Image(systemName: "arrow.right")
                                .padding()
                                .font(.largeTitle)
                                .foregroundColor(.black)
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
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}



#Preview {
    PersonInfoView()
}

//
//  personInfoView.swift
//  uyuSleep
//
//  Created by Berke Kesgin on 12.09.2024.
//

import SwiftUI

struct PersonInfoView: View {
    
    //MARK: - Properties
    
    @StateObject private var personInfoVM = PersonInfoViewModel()
    
    @State private var nameText: String = ""
    @State private var surNameText: String = ""
    
    @State private var selectedDate = Date()
    
    //MARK: - View
    
    var body: some View {
        
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
            
            // ok yönleri ile sayfa geçişleri için
            HStack{
                // birinci ok
                VStack{
                    Button(action: {
                        // Birinci ok için aksiyonlar
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
                        // İkinci ok için aksiyonlar
                        print("İkinci ok tıklandı")
                    }) {
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
    

    //MARK: - Functions
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }

}

struct RectangleView: View {
    var body: some View {
        HStack(spacing: 10) {
            // Daire 1
            Circle()
                .fill(Color.secondary)
                .frame(width: 10, height: 10)
            
            // Daire 2
            Circle()
                .fill(Constants.buttonBackgroundColor)
                .frame(width: 15, height: 15)
            
            // Daire 3
            Circle()
                .fill(Color.secondary)
                .frame(width: 10, height: 10)
        }
        .padding()
        .background(
            Rectangle()
                .fill(Color.gray)
                .cornerRadius(Constants.buttonCornerRadius)
                .frame(width: 100, height: 40)
        )
    }
}


#Preview {
    PersonInfoView()
}

//
//  RegistrationProgressView.swift
//  uyuSleep
//
//  Created by Berke Kesgin on 15.09.2024.
//

import SwiftUI

struct RegistrationProgressView: View {
    
    //MARK: - Properties
    
    private var count: Int {
        stepperValue + 1
    }
    
    private let circleSize: CGFloat = 20
    private let selectedCircleSize: CGFloat = 30
    
    private let spacing: CGFloat = 10

    private let backgroundColor: Color = .gray
    private let backgroundHeight: CGFloat = 60
    
    @State public var selectedIndex: Int?
    @State private var stepperValue: Int = 2

    private let firstColor: Color = .black
    private let secondColor: Color = .white
    
    
    //MARK: - View
    
    var body: some View {
        
        HStack{
            HStack{
                Button(action: backButtonTapped) {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }
                .padding()
            }
            
            HStack {
                ForEach(0..<count, id: \.self) { index in
                    VStack {
                        Circle()
                            .frame(width: index == selectedIndex ? selectedCircleSize : circleSize,
                                   height: index == selectedIndex ? selectedCircleSize : circleSize)
                            .frame(width: circleSize, height: circleSize)
                            .foregroundColor(index == selectedIndex ? firstColor : secondColor)
                    }
                    
                }
                .padding(.horizontal, spacing / 2)
            }
            .padding()
            .background(
                backgroundColor
                    .frame(width: totalWidth + 2 * (spacing / 2), height: backgroundHeight)
                    .cornerRadius(20)
            )
            
            HStack {
                    Button(action: nextButtonTapped) {
                        Image(systemName: "arrow.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    }
                .padding()
            }

            

        }
    
    }
    
    // MARK: - Computed Properties
    
    private var totalWidth: CGFloat {
        CGFloat(count) * circleSize + CGFloat(count + 5) * spacing
    }
    
    // MARK: - Functions
    
    private func backButtonTapped() {
        if let selectedIndex = selectedIndex, selectedIndex > 0 {
            self.selectedIndex = selectedIndex - 1
        }
    }

    private func nextButtonTapped() {
        if let selectedIndex = selectedIndex {
            if selectedIndex < count - 1 {
                self.selectedIndex = selectedIndex + 1
            }
        } else {
            self.selectedIndex = 0
        }
    }

}

#Preview {
    RegistrationProgressView(selectedIndex: 1)
}

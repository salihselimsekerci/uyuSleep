//
//  File.swift
//  uyuSleep
//
//  Created by Berke Kesgin on 12.09.2024.
//

import SwiftUI

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

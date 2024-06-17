//
//  ViewForText.swift
//  RandomFacts
//
//  Created by Дмитрий on 17.06.2024.
//

import SwiftUI

struct ViewForText: View {
    var text: String?
    var body: some View {
        //MARK: View for text of fact
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 350, height: 250)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .bottom))
            Text(text ?? "")
                .foregroundStyle(.black)
                .font(.title3)
                .padding()
        }
    }
}

#Preview {
    ViewForText()
}

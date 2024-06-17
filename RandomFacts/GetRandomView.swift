//
//  GetRandomView.swift
//  RandomFacts
//
//  Created by Дмитрий on 17.06.2024.
//

import SwiftUI

struct GetRandomView: View {
    @StateObject private var fact = APIForFact()
    @State private var onceUpdate: Bool = true
    var body: some View {
        VStack {
            Text("Random Fact")
                .font(.system(size: 42))
            //MARK: Call view for text
            ViewForText(text: fact.randomFact?.text)
            
            //MARK: Button for get random fact
            Button(action: {
                Task {
                    await fact.fetchRandomyFact()
                }
            }, label: {
                Text("Get random useless fact")
            })
            .buttonStyle(.borderedProminent)
        }
        .padding()
        
        //MARK: Update the view only once
        .onAppear {
            if self.onceUpdate {
                self.onceUpdate = false
                Task {
                    await fact.fetchRandomyFact()
                }
            }
        }
    }
}

#Preview {
    GetRandomView()
}

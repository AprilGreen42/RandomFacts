//
//  DailyView.swift
//  RandomFacts
//
//  Created by Дмитрий on 17.06.2024.
//

import SwiftUI

struct DailyView: View {
    @StateObject var fact = APIForFact()
    
    var body: some View {
        VStack {
            Text("Daily Fact")
                .font(.system(size: 42))
            
            //MARK: Call view for text
            ViewForText(text: fact.dailyFact?.text)
            
        }
        .padding()
        
        //MARK: Call function for get daily fact
        .onAppear {
            Task {
                await fact.fetchDailyFact()
            }
        }

    }
}

#Preview {
    DailyView()
}

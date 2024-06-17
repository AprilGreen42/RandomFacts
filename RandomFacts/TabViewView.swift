//
//  TabViewView.swift
//  RandomFacts
//
//  Created by Дмитрий on 17.06.2024.
//

import SwiftUI

struct TabViewView: View {
    @State private var selection: Int = 0
    var body: some View {
        
        //MARK: TabView
        TabView(selection: $selection) {
            DailyView().tabItem {
                Text("Daily")
                Image(systemName: "calendar")
            }.tag(0)
            GetRandomView().tabItem {
                Text("Random Fact")
                Image(systemName: "graduationcap")
            }.tag(1)
        }
    }
}

#Preview {
    TabViewView()
}

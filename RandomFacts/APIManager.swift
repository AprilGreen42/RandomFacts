//
//  APIManager.swift
//  RandomFacts
//
//  Created by Дмитрий on 17.06.2024.
//

import Foundation

//MARK: Essence for API
struct Fact: Codable, Identifiable {
    var id: String
    var text: String
    var source: String
    var source_url: String
    var language: String
    var permalink: String
}

//MARK: Call API
class APIForFact: ObservableObject {
    @Published var dailyFact: Fact?
    @Published var randomFact: Fact?
    
    //MARK: API for daily fact
    func fetchDailyFact() async {
        do {
            guard let url = URL(string: "https://uselessfacts.jsph.pl//api/v2/facts/today") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            dailyFact = try JSONDecoder().decode(Fact.self, from: data)
        } catch {
            print("Ошибка при загрузке данных: \(error)")
        }
    }
    
    //MARK: API for random fact
    func fetchRandomyFact() async {
        do {
            guard let url = URL(string: "https://uselessfacts.jsph.pl//api/v2/facts/random") else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            randomFact = try JSONDecoder().decode(Fact.self, from: data)
        } catch {
            print("Ошибка при загрузке данных: \(error)")
        }
    }
}

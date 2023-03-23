//
//  DeckViewModel.swift
//  Assignment3
//
//  Created by user231162 on 3/22/23.
//

import Foundation

class DeckViewModel : ObservableObject {
            
    @Published private(set) var deckData = [CardModel]()
    @Published var hasError = false
    @Published var error : CardModelError?
    private let url = "https://deckofcardsapi.com/api/deck/new/draw/?count=52"
            
    @MainActor
    func fetchData() async {
        if let url = URL(string: self.url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode(CardResults?.self, from: data) else {
                    self.hasError.toggle()
                    self.error = CardModelError.decodeError
                    return
                }
                self.deckData = results.cards
            } catch {
                self.hasError.toggle()
                self.error = CardModelError.customError(error: error)
            }
        }
    }
}

extension DeckViewModel {
    enum CardModelError : LocalizedError {
        case decodeError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .decodeError:
                return "Decoding Error"
            case .customError(let error):
                return error.localizedDescription
            }
        }
    }
}

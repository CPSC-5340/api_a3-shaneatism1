//
//  Deck.swift
//  Assignment3
//
//  Created by user231162 on 3/22/23.
//

import SwiftUI

struct Deck: View {
    
    @ObservedObject var deckvm = DeckViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(deckvm.deckData, id: \.self) {card in
                    NavigationLink {
                        CardDetail(card: card)
                    } label: {
                        Text(card.value) + Text(" of ") + Text(card.suit)
                    }
                }
            }
            .task {
                await deckvm.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("Deck of Cards")
        }
    }
}

struct Deck_Previews: PreviewProvider {
    static var previews: some View {
        Deck()
    }
}

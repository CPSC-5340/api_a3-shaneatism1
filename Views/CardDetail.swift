//
//  CardDetail.swift
//  Assignment3
//
//  Created by user231162 on 3/22/23.
//

import SwiftUI

struct CardDetail: View {
    
    var card : CardModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text(card.value) + Text(" of ") + Text(card.suit)
                    .font(.system(size: 20))
                
                let url = URL(string: card.image)
                let data = try? Data(contentsOf: url!)
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    Image(uiImage: image!)
                }
            }
        }
    }
}

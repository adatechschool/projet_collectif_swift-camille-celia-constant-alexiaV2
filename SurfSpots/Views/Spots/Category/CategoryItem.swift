//
//  CategoryItem.swift
//  SurfSpots
//
//  Created by Camille FOL on 12/05/2022.
//

import SwiftUI

struct CategoryItem: View {

    var spot : Record
    
    var body: some View {
        VStack (alignment: .leading) {
            AsyncImage(url: URL(string: spot.fields.photos[0].thumbnails.large.url), content:{image in
                image
                    .renderingMode(.original)
                    .resizable()
                    .frame(width:155, height:155 )
                    .cornerRadius(5)
            },
                       placeholder: {
                ProgressView()
            }
            )
            
            Text(spot.fields.destination)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(spot: ModelData().spots[0])
    }
}

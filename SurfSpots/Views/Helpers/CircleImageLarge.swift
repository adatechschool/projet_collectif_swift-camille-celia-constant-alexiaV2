//
//  CircleImage.swift
//  SurfSpots
//
//  Created by Camille FOL on 10/05/2022.
//

import SwiftUI

struct CircleImageLarge: View {
    var spot: Record
    
    var body: some View {
        AsyncImage(url: URL(string: spot.fields.photos[0].thumbnails.large.url), content:{image in
            image.resizable()
                .frame(width:300, height:300 )
        },
                   placeholder: {
            ProgressView()
        }
        )
        .clipShape(Circle())
        .overlay {
            Circle().stroke(.white, lineWidth: 4)
        }
        .shadow(radius: 7)
    }
}

struct CircleImageLarge_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        CircleImageLarge(spot: modelData.spots[0])
            .environmentObject(modelData)
    }
}

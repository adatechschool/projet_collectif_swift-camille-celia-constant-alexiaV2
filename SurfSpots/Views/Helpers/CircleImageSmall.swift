//
//  CircleImage.swift
//  SurfSpots
//
//  Created by Camille FOL on 10/05/2022.
//

import SwiftUI

struct CircleImageSmall: View {
    var spot: Record
    
    var body: some View {
        AsyncImage(url: URL(string: spot.fields.photos[0].thumbnails.small.url))
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 1)
            }
            
            .frame(width: 50, height:50)
            .shadow(radius: 2)
    }
}

struct CircleImageSmall_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        CircleImageSmall(spot: modelData.spots[0])
            .environmentObject(modelData)
    }
}

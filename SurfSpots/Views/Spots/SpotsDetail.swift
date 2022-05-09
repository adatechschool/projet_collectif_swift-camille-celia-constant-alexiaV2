//
//  SpotsDetail.swift
//  SurfSpots
//
//  Created by Camille FOL on 04/05/2022.
//

import SwiftUI

struct SpotsDetail: View {
    @EnvironmentObject var modelData: ModelData
    var spot: Record
    
    var spotIndex: Int {
        $modelData.spots.firstIndex(where: { $0.id == spot.id })!
    }
    
    var body: some View {
        //Diff lvl, Destination, Destinationstate
        //Dates de saison, link, geocode
        //image
        VStack {
            HStack {
                
                Text(spot.fields.surfBreak[0])
                Text(String(spot.fields.difficultyLevel))
            }
            
            AsyncImage(url: URL(string: spot.fields.photos[0].thumbnails.large.url))´
            
            Spacer()
            HStack {
                Text(spot.fields.destination)
                    
                Text(spot.fields.destinationStateCountry)
            }
        }
    }
}

struct SpotsDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        ZStack {
            SpotsDetail(spot: modelData.spots[0])
                .environmentObject(modelData)
        }
    }
}

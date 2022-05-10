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
        ScrollView{
            //Diff lvl, Destination, Destinationstate
            //Dates de saison, link, geocode
            //image
            VStack {
                //MapView()
                //Geocode
                Text(spot.fields.geocode)
                
                AsyncImage(url: URL(string: spot.fields.photos[0].thumbnails.large.url))
                
                HStack {
                    Text(spot.fields.destination)
                    //isFavoriteButton
                    Text(String(spot.fields.difficultyLevel))
                    Text("/5")
                }
                
                Spacer()
                HStack {
                    Text(spot.fields.destinationStateCountry)
                    
                    Text(spot.fields.surfBreak[0])
                }
                Divider()
            }
            VStack {
                Text("Meilleure période")
                HStack {
                    Text(spot.fields.seasonStart)
                    Text(spot.fields.seasonEnd)
                }
                Spacer()
                Text("Plus d'information sur ce Spot")
                //Link(destination: spot.fields.link)
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

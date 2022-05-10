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
            VStack {
                //MapView()
                //Geocode
                Text(spot.fields.geocode)
                
                /*AsyncImage(url: URL(string: spot.fields.photos[0].thumbnails.large.url))*/
                CircleImageLarge(spot: spot)
                
                HStack {
                    Text(spot.fields.destination)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(spot.fields.difficultyLevel))
                        .multilineTextAlignment(.trailing)
                    Text("/5")
                        .multilineTextAlignment(.trailing)
                }
                
                Spacer()
                HStack {
                    Text(spot.fields.destinationStateCountry)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                    
                    Text(spot.fields.surfBreak[0])
                        .multilineTextAlignment(.trailing)
                }
                Divider()
            }
            VStack {
                Text("Meilleure période")
                    .font(.title)
                HStack {
                    Text(spot.fields.seasonStart)
                    //flèche
                    Text(spot.fields.seasonEnd)
                }
                Spacer()
                Text("Plus d'information sur ce Spot")
                //Link(destination: spot.fields.link)
            }
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
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

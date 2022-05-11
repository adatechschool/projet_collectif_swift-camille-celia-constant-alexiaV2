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
               // Text(spot.fields.stringDecode)
                CircleImageLarge(spot: spot)
                VStack(alignment: .leading) {
                    HStack {
                        Text(spot.fields.destination)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Spacer()
                        Text("Difficulté :")
                        Text(String(spot.fields.difficultyLevel) + "/5")
                    }
                    Spacer()
                    HStack {
                        Text(spot.fields.destinationStateCountry)
                            .font(.subheadline)
                        Spacer()
                        Text(spot.fields.surfBreak[0])
                    }
                }
                .padding()
                Divider()
            }
            VStack {
                Text("Meilleure période")
                    .font(.headline)
                HStack {
                    Text(spot.fields.seasonStart)
                    Text("➟")
                        .font(.title)
                    Text(spot.fields.seasonEnd)
                }
                Spacer()
                HStack {
                Text("Plus d'information sur ce")
                Link("Spot",destination: URL(string: spot.fields.link)!)
                    .environment(\.openURL, OpenURLAction { url in
                        Swift.print("Open \(url)")
                        return .handled
                    })
                }
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

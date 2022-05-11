//
//  SpotsRow.swift
//  SurfSpots
//
//  Created by Camille FOL on 04/05/2022.
//

import SwiftUI

struct SpotsRow: View {
    var spot: Record
    
    var body: some View {
        HStack {
            CircleImageSmall(spot: spot)
                .alignmentGuide(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Guide@*/.leading/*@END_MENU_TOKEN@*/) { dimension in
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/dimension[.top]/*@END_MENU_TOKEN@*/
                }

            Text(spot.fields.destination)
            
            Spacer()
            
            //if spot.isFavorite {
            if spot.fields.destination == "Pipeline"||spot.fields.destination == "Superbank"||spot.fields.destination == "Pasta Point" { Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            //}
            if spot.fields.destination == "Hossegor"||spot.fields.destination == "Bolinas"||spot.fields.destination == "Horseshoe Bay Beach"||spot.fields.destination == "Black's Beach"||spot.fields.destination == "Potrero Grande" { Image(systemName: "xmark.diamond.fill")
                    .foregroundColor(.red)
            }
        }
    }
}

struct SpotsRow_Previews: PreviewProvider {
    static var spots = ModelData().spots
    
    static var previews: some View {
        ZStack {
        Group {
            SpotsRow(spot: spots[0])
            SpotsRow(spot: spots[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
}

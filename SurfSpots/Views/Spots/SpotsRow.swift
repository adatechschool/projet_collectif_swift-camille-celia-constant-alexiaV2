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
            
            Text(spot.name)
            
            Spacer()
            
            if spot.favorite {
              Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
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

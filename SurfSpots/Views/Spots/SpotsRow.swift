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
            Text(spot.fields.destination)
            /*.resizable()
             .frame(width: 50, height: 50)*/
            //Text(spot.records.fields.address)
            
            Spacer()
            
            /*if spot.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }*/
        }
    }
}

struct SpotsRow_Previews: PreviewProvider {
    static var spots = ModelData().spots
    
    static var previews: some View {
        ZStack {
        Group {
            SpotsRow(spot: spots[1])
            //SpotsRow(spot: spots[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
}

//
//  CategoryRow.swift
//  SurfSpots
//
//  Created by Camille FOL on 12/05/2022.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName : String
    var items : [Record]
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (alignment: .top, spacing:0) {
                    ForEach(items) {
                        spot in
                        NavigationLink{
                            SpotsDetail(spot: spot)
                        } label: {
                            CategoryItem(spot: spot)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var spots = ModelData().spots
    
    static var previews: some View {
        CategoryRow(
            categoryName: spots[0].surfBreak/*[0].rawValue*/,
            items: Array(spots.prefix(4))
        )
    }
}

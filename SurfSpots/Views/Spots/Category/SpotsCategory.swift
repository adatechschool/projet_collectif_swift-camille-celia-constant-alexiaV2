//
//  SpotsCategory.swift
//  SurfSpots
//
//  Created by Camille FOL on 12/05/2022.
//

import SwiftUI

struct SpotsCategory: View {
    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        NavigationView {
            List {
                AsyncImage(url: URL(string: modelData.featured?.photos ?? "https://jardinage.lemonde.fr/images/dossiers/2021-01/choisir-chaton-101948.jpg"), content:{image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .listRowInsets(EdgeInsets())
                },
                           placeholder: {
                    ProgressView()
                }
                )
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Categories")
            .onAppear {
                modelData.getSpots()
            }
        }
    }
}

struct SpotsCategory_Previews: PreviewProvider {
    static var previews: some View {
        SpotsCategory()
            .environmentObject(ModelData())
    }
}

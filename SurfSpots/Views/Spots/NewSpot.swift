//
//  NewSpot.swift
//  SurfSpots
//
//  Created by Camille FOL on 12/05/2022.
//

import SwiftUI
import Foundation

struct NewSpot: View {
    
    @State var name : String = ""
    @State var state: String = ""
    @State var country: String = ""
    @State var surfBreak : String = ""
    @State var img : String = ""
    @State var diff = "1"
    let difficulties = ["1", "2", "3", "4", "5"]
    @State private var seasonStart = Date()
    @State private var seasonEnd = Date()
    @State var link : String = ""
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Mandatory fields")){
                    TextField("Spot's Name", text: $name)
                    TextField("Spot's State", text: $state)
                    TextField("Spot's Country", text: $country)
                    TextField("Spot's Surf Break", text: $surfBreak)
                    TextField("Image (url only)", text : $img)
                }
                Section(header: Text("Other Information")){
                    Text("Spot's Difficulty")
                    Picker("Diff", selection: $diff) {
                        ForEach(difficulties, id: \.self) {
                            Text($0)
                                .padding()
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Spot's Magic Seaweed Link (url)", text: $link)
                    
                    Text("Start of peak season")
                    DatePicker("Start Date", selection: $seasonStart, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                    
                    Text("End of peak season")
                    DatePicker("End Date", selection: $seasonEnd, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                    
                }
                Section {
                    Button(action: {
                        Task {
                            do {
                                let dateFormatter = DateFormatter()
                                
                                dateFormatter.dateFormat = "YYYY-MM-dd"
                                
                                var newSpot = Record(id: 9, name: name, surfBreak: surfBreak, difficultyLevel: Int(diff.components(separatedBy: "")[0])!, favorite: false, stateCountry: "\(state), \(country)", address:"\(name), \(state), \(country)", link: link, photos: img, seasonStart: dateFormatter.string(from:seasonStart), seasonEnd: dateFormatter.string(from:seasonEnd), createdTime: "maintenant")
                                
                                let jsonSpot = try JSONEncoder().encode(newSpot)
                                
                                let url = URL(string: "http://192.168.5.241:8000/spot")!
                                var request = URLRequest(url: url)
                                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                                request.httpMethod = "POST"
                                
                                
                                let (data, _) = try await URLSession.shared.upload(for: request, from: jsonSpot)
                                print("Added")
                                print(dateFormatter.string(from:seasonStart))
                                
                            } catch {
                                print("errorre")
                            }
                        }
                    })
                    {
                        Text("Add a new spot")
                    }
                }
            }
        }
    }
}

struct NewSpot_Previews: PreviewProvider {
    static var previews: some View {
        NewSpot()
    }
}

//
//  ContentView.swift
//  JPApexApp
//
//  Created by Pelin Aybar on 7.02.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    let predators = Predators()
    @State var searchText = ""
    
    var filteredDinos:[ApexPredator]{
        if searchText.isEmpty {
            return predators.apexPredators
        }else{
            return predators.apexPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            List(filteredDinos) { predator in //her bir predator içinde //List(predators.apexPredators) vardı sonra filtreleme için yukarda filtereddinos ile değiştirdik
                NavigationLink{
                    
                }label:{
                    HStack{
                        //dinospur image
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100,height: 100)
                            .shadow(color: .white, radius: 2)//gölge resim
                        VStack(alignment: .leading) // leading sola hizalama
                        {
                            //Name
                            Text(predator.name)
                                .fontWeight(.bold)
                            //Type
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal,15)
                                .padding(.vertical,5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                        }
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
        }
        .preferredColorScheme(.dark) // dark mode
    }
}


#Preview {
    ContentView()
}

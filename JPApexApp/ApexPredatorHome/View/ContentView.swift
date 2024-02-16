//
//  ContentView.swift
//  JPApexApp
//
//  Created by Pelin Aybar on 7.02.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var searchText = ""
    @State var alphabetical = false
    @State var currentSelection = PredatorType.all
    
    let predators = Predators()

    var filteredDinos:[ApexPredator]{
        
        predators.filter(by: currentSelection)
        predators.sort(by: alphabetical)
        
        return predators.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack{
            List(filteredDinos) { predator in //her bir predator içinde //List(predators.apexPredators) vardı sonra filtreleme için yukarda filtereddinos ile değiştirdik
                NavigationLink{
                    PredatorDetail()
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
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        withAnimation{ //animasyonla değiştirme
                            alphabetical.toggle()
                        }
                    } label: {
             //          if alphabetical{
              //              Image(systemName: "film")
              //          }else{
               //             Image(systemName: "textformat")
                //        }
                        //ternary operatörü denir buna 3 lü
                        Image(systemName: (alphabetical ? "film" : "textformat"))
                            .symbolEffect(.bounce, value: alphabetical)
                            .fontWeight(.bold)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu{
                        Picker("Filter", selection: $currentSelection.animation()){
                            ForEach(PredatorType.allCases){ type in
                                Label(type.rawValue .capitalized, systemImage: type.icon)
                            }
                        }
                    }label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                    .fontWeight(.bold)
                }
            }
        
        }
        .preferredColorScheme(.dark) // dark mode
    }
}


#Preview {
    ContentView()
}

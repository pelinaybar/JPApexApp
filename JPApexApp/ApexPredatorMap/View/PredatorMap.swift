//
//  PredatorMap.swift
//  JPApexApp
//
//  Created by Pelin Aybar on 16.02.2024.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
    let predators = Predators()
    @State var position: MapCameraPosition
    @State var satellite = false
    var body: some View {
        Map(position:$position){
            ForEach(predators.apexPredators){ predator in
                Annotation(predator.name, coordinate: predator.location){
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .shadow(color:.brown, radius: 5)
                        .scaleEffect(x:-1)
                }
                .annotationSubtitles(.hidden)
            }
        }
        .mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic)) //haritada gerçekçi görünüş
        .overlay(alignment: .bottomTrailing) {
            Button{
                satellite.toggle()
            }label:{
                Image(systemName: satellite ? "globe.americas.fill" : "globe.americas")
                    .font(.title)
                    .fontWeight(.bold)
                    .imageScale(.large)
                    .foregroundColor(.brown)
                    .padding(3)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    .shadow(radius: 10)
                    .padding()
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    //heading ve pitch yön ve eğimdir açıdan bakma
    PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[1].location, distance: 1000, heading: 300, pitch: 70)))
        .preferredColorScheme(.dark)
}

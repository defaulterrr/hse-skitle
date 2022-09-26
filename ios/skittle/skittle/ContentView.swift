//
//  ContentView.swift
//  skittle
//
//  Created by Svyat Petrov on 24.09.2022.
//

import SwiftUI
import MapKit

var londonLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 51.494959, longitude: -0.125811)

struct CurLocation: Identifiable {
    var id = UUID()
    var coordinates:CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(
        center: londonLocation,
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )

    @State private var showJobs: Bool = false
    
    @State private var locations: [CurLocation] = [CurLocation(coordinates: londonLocation)]
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) {
                MapAnnotation(coordinate: $0.coordinates) {
                    Circle()
                        .foregroundColor(.blue)
                        .frame(width: 15, height: 15, alignment: .center)
                        .shadow(radius: 20)
                        .overlay {
                            Circle()
                                .foregroundColor(.blue)
                                .opacity(0.5)
                                .frame(width: 205, height: 205, alignment: .center)
                        }
                }
            }
            .popover(isPresented: $showJobs) {
                TiledView()
            }
        }
        .overlay(content: {
            VStack {
                Text("Westminster, London, UK")
                    .font(Font.title.bold())
                    .offset(x: 0, y: 100)
                Spacer()
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 350, height: 50, alignment: .center)
                    .foregroundColor(BrandColors.Charcoal)
                    .overlay(content: {
                        Text("See Available Services")
                            .foregroundColor(BrandColors.Ivory)
                    })
                    .onTapGesture {
                        self.showJobs.toggle()
                    }
                Spacer()
                    .frame(width: 100, height: 20, alignment: .leading)
            }
        })
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            ContentView()
                .previewDevice("iPhone 13")
        }
    }
}

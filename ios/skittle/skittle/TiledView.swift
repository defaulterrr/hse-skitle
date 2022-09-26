//
//  TiledView.swift
//  skittle
//
//  Created by Svyat Petrov on 26.09.2022.
//

import SwiftUI

struct ServiceOption {
    var name: String
    var minPrice: Float
    var currency: String
    
    var imageName: String
}

struct TiledView: View {
    var body: some View {
        VStack {
            Spacer(minLength: 20)
            ScrollView {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Available Services:")
                        .padding(15)
                        .font(Font.title2.weight(.heavy))
                        .foregroundColor(BrandColors.Charcoal)
                    Spacer(minLength: 10)
                    TileGroup(name: "Electricity", enTime: "~30m")
                    TileGroup(name: "Plumbing", enTime: "~15-20m")
                    TileGroup(name: "General Repairs", enTime: "~45-60m")
                }
            }
        }
        .background(BrandColors.Ivory)
        
    }
}

struct TileGroup: View {
    var name: String
    var enTime: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(BrandColors.Charcoal)
            .overlay {
                VStack {
                    HStack{
                        Text(name)
                            .foregroundColor(BrandColors.Ivory)
                            .padding()
                            .font(Font.bold(Font.body)())
                        Spacer()
                        Text("Arrival: \(enTime)")
                            .foregroundColor(BrandColors.Ivory)
                            .padding()
                            .font(Font.bold(Font.body)())
                    }
                    Spacer()
                    HStack {
                        ScrollView(.horizontal) {
                            HStack(alignment: .firstTextBaseline, spacing: 15) {
                                TileGroupServiceOption(option: ServiceOption.init(name: "Checkup", minPrice: 100, currency: "$", imageName: "checkmark.circle"))
                                TileGroupServiceOption(option: ServiceOption.init(name: "Minor Fix", minPrice: 150, currency: "$", imageName: "latch.2.case.fill"))
                                TileGroupServiceOption(option: ServiceOption.init(name: "Major Fix", minPrice: 200, currency: "$", imageName: "checkmark.circle"))

                            }
                        }
                        
                    }
                    .padding()
                    Spacer()
                }
                .cornerRadius(25)
            }
            .frame(height: 175, alignment: .leading)
            .padding(5)
        
        
    }
}

struct TileGroupServiceOption: View {
    var option: ServiceOption
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(BrandColors.Glaucous)
            .overlay {
                VStack(alignment: .leading) {
                    HStack {
                        Text(option.name)
                            .foregroundColor(BrandColors.Ivory)
                        Image(systemName: option.imageName)
                            .foregroundColor(BrandColors.Ivory)
                    }
                    .padding()
                    HStack {
                        Text("From \(Int(option.minPrice)) \(option.currency)")
                            .foregroundColor(BrandColors.Ivory)
                    }
                    .padding()
                }
                
                
                    
            }
            .frame(width: 135, height: 85, alignment: .leading)
        
    }
}

struct TiledView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  GamesView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 07/06/22.
//

import SwiftUI

struct GamesView: View {
    
    let game: GameList
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                VStack {
                    Text("\(game.title)")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    
                    HStack {
                        Text("- \(game.price_cut)%")
                            .font(.title2)
                            .fontWeight(.medium)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .background(Color.purple)
                            .cornerRadius(10)
                            .foregroundColor(Color.white)
                        
                        Text("R$ \(game.price_new, specifier: "%.2f")")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                    Text("Preço original: R$ \(game.price_old, specifier: "%.2f")")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("iceblue"))
                        .padding(.bottom, 50)
                    
                    Link(destination: URL(string: "\(game.urls.buy)")!){
                        Text("Ir para \(game.shop.name)")
                            .font(.title3)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                    }
                    .padding()
                    .background(Color.blue.opacity(0.9))
                    .cornerRadius(20)
                }
                
                //        .padding()
                //        .frame(maxWidth: .infinity)
                
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(LinearGradient(colors: [.indigo, .purple.opacity(0.8)], startPoint: .leading, endPoint: .trailing))
                .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: -5, y: -5)
            }
            .padding()
            Spacer()
        }
        .ignoresSafeArea()
        .background(Color.indigo.opacity(0.8))
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView(game: .init(plain: "residentevil", title: "Resident Evil", price_new: 9.99, price_old: 39.99, price_cut: 75, shop: .init(name: "Steam"), urls: .init(buy: "https://store.steampowered.com/app/304240/")))
    }
}

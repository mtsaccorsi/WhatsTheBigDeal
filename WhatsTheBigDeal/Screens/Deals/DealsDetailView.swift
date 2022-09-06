//
//  DealsView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 07/06/22.
//

import SwiftUI

struct DealsDetailView: View {
    
    let games: GameList
    
    var body: some View {
        
        ZStack {
            VStack (alignment: .leading) {
                
                Text("\(games.title)")
                    .font(.title3)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("R$\(games.price_old, specifier: "%.2f")")
                                .fontWeight(.semibold)
                                .strikethrough()
                                .foregroundColor(Color("iceblue"))
                            
                            Text("\(games.shop.name)")
                                .fontWeight(.semibold)
                                .padding(.vertical, 2)
                                .padding(.horizontal, 8)
                                .background(Color.blue.opacity(0.9))
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                        }
                        
                        HStack {
                            Text("por R$\(games.price_new, specifier: "%.2f")")
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            
                            Text("- \(games.price_cut)%")
                                .fontWeight(.medium)
                                .padding(.vertical, 2)
                                .padding(.horizontal, 8)
                                .background(Color.purple)
                                .cornerRadius(10)
                                .foregroundColor(Color.white)
                                .shadow(color: .black, radius: 0.1)
                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Link(destination: URL(string: "\(games.urls.buy)")!){
                        Image(systemName: "plus.app.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(.white.opacity(0.8), .black.opacity(0.3))
                    }
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 10)
        .background(LinearGradient(colors: [.indigo.opacity(0.9), .purple.opacity(0.8)], startPoint: .leading, endPoint: .trailing))
        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
        .shadow(color: Color.black.opacity(0.09), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.09), radius: 5, x: -5, y: -5)
        
    }
}

struct DealsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DealsDetailView(games: .init(plain: "residentevil", title: "Resident Evil", price_new: 24.99, price_old: 45.00, price_cut: 44, shop: .init(name: "Steam"), urls: .init(buy: "https://store.steampowered.com/app/1180660/")))
    }
}

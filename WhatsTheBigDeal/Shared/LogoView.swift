//
//  LogoView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 31/08/22.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
            HStack {
                ZStack {
                    Text("Pro")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white.opacity(0.7))
                    Image(systemName: "scribble")
                        .resizable()
                        .rotationEffect(.degrees(-10))
                        .frame(width: 50, height: 30)
                        .foregroundColor(Color("iceblue"))

                }
                
                HStack {
                    Text("Poor")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(Color.indigo)
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(Color.white.opacity(0.7))
                .cornerRadius(10)
                .rotationEffect(.degrees(8))
                
                Text("Player")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white.opacity(0.7))
            }
//            .padding(.leading)
            .scaledToFill()
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .background(Color.indigo)
    }
}

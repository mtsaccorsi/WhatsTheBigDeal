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
                    //                        .strikethrough(color: .black)
                    Image(systemName: "scribble")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                HStack {
                    Text("Poor")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                //                    .background(Color.pink.opacity(1))
                .background(LinearGradient(colors: [.black.opacity(0.2), .black.opacity(0.5)], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(10)
                .rotationEffect(.degrees(8))
                
                Text("Player")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white.opacity(0.7))
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .background(Color.indigo)
    }
}

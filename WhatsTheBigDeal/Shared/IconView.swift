//
//  IconView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 10/09/22.
//

import SwiftUI

struct IconView: View {
    var body: some View {
        ZStack {
            Image(systemName: "gamecontroller.fill")
                .resizable()
                .frame(width: 50, height: 30, alignment: .center)
                .foregroundColor(Color.indigo.opacity(0.7))
                .offset(y: 10)
                .zIndex(1)
            Image(systemName: "bag.fill")
                .resizable()
                .frame(width: 85, height: 100, alignment: .center)
                .foregroundColor(Color.white.opacity(0.7))
                .zIndex(0)
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.indigo)
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView()
    }
}

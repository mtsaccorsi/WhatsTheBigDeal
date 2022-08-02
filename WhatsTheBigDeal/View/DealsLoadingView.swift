//
//  LoadingView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 08/06/22.
//

import SwiftUI

struct DealsLoadingView: View {
    
    var isShowing: Bool
    
    var body: some View {                    
        VStack {
            Spacer()
            ProgressView("Carregando descontos...")
//                .progressViewStyle(LinearProgressViewStyle())
//                .padding()
//                .foregroundColor(.white)
            Spacer()
        }
        .opacity(isShowing ? 1 : 0)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        DealsLoadingView(isShowing: true)
    }
}

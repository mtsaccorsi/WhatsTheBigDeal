//
//  LoadingView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 08/06/22.
//

import SwiftUI

struct ListLoadingView: View {
    
    var isShowing: Bool
    
    var body: some View {                    
        VStack {
            Spacer()
            
            ProgressView("Carregando descontos...")
                .tint(.indigo)
                .foregroundColor(.indigo.opacity(0.7))

            Spacer()
        }
        .opacity(isShowing ? 1 : 0)
        .padding(.top, 12)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ListLoadingView(isShowing: true)
    }
}

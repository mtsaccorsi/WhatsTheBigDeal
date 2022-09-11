//
//  AboutView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 10/09/22.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        
        VStack {
            Text("Desenvolvido por Matheus Accorsi")
                .padding(.bottom, 5)
                .font(.system(size: 18))
                .foregroundColor(.white.opacity(0.4))
                .multilineTextAlignment(.center)
            Text("Alimentado pela API IsThereAnyDeal.com")
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.4))
                .multilineTextAlignment(.center)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.indigo)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

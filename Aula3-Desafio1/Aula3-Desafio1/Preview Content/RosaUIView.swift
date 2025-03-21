//
//  RosaUIView.swift
//  Aula3-Desafio1
//
//  Created by Turma01-23 on 21/03/25.
//

import SwiftUI

struct RosaUIView: View {
    var body: some View {
        VStack{
            ZStack{
                Color.pink
                    .ignoresSafeArea(edges: .top)
                            Circle().scaledToFit()
                            Image(systemName:"paintbrush")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.pink)
                                .frame(width: 300, height: 300)
                                
            }
        }
    }
}

#Preview {
    RosaUIView()
}

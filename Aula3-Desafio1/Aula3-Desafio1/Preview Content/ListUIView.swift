//
//  ListUIView.swift
//  Aula3-Desafio1
//
//  Created by Turma01-23 on 21/03/25.
//

import SwiftUI

struct ListUIView: View {
    let lista = ["Item1","Item2","Item3"]
    
    var body: some View{
        NavigationStack{
            List{
                HStack{
                    NavigationLink(destination: RosaUIView()){
                        Text("Rosa")
                    }
                }
                HStack{
                    NavigationLink(destination: AzulUIView()){
                        Text("Azul")
                    }
                }
                HStack{
                    NavigationLink(destination: CinzaUIView()){
                        Text("Cinza")
                    }

                }
            }
            .navigationTitle("Listas")
        }
        
    }
    
}
#Preview {
    ListUIView()
}

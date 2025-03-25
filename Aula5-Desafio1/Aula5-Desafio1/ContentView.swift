//
//  ContentView.swift
//  Aula5-Desafio1
//
//  Created by Turma01-23 on 25/03/25.
//

import SwiftUI
import MapKit

    struct Location: Hashable {
        let nome: String
        let foto: String
        let descricao: String
        let latitude: Double
        let longitude: Double
    }

    let arrayLocals: [Location] = [
        Location(nome: "Grand Canyon", foto: "https://ichef.bbci.co.uk/ace/standard/976/cpsprodpb/3F83/production/_105795261_gettyimages-669737652.jpg.webp", descricao: "O Grand Canyon é um dos maiores e mais impressionantes desfiladeiros do mundo, localizado no estado do Arizona, EUA.", latitude: 36.1069, longitude: -112.1129),
        Location(nome: "Machu Picchu", foto: "https://www.machu-picchu.org/pt/wp-content/uploads/2019/05/machu-picchu-with-few-clouds-1024x1024.jpg.webp", descricao: "Machu Picchu é uma antiga cidade inca localizada no alto das montanhas dos Andes, no Peru, conhecida por suas ruínas misteriosas e paisagens deslumbrantes.", latitude: -13.1631, longitude: -72.5450),
        Location(nome: "Taj Mahal", foto: "https://www.loucoporviagens.com.br/wp-content/uploads/2020/07/capa-post-taj-mahal-india.jpg", descricao: "O Taj Mahal é um mausoléu de mármore branco localizado em Agra, na Índia, famoso pela sua arquitetura imponente e beleza.", latitude: 27.1751, longitude: 78.0421),
        Location(nome: "Parque Nacional Banff", foto: "https://gd-canada.sfo2.digitaloceanspaces.com/2016/11/Banff-Park.jpg", descricao: "O Parque Nacional Banff, no Canadá, oferece paisagens deslumbrantes com montanhas rochosas, lagos cristalinos e uma rica fauna.", latitude: 51.4968, longitude: -115.9281),
        Location(nome: "Cristo Redentor", foto: "https://aosviajantes.com.br/wp-content/uploads/2016/08/novo-cristo-redentor-corcovado-paineiras.jpg.webp", descricao: "O Cristo Redentor é uma estátua gigante de Jesus Cristo, localizada no Rio de Janeiro, Brasil, e é um dos maiores ícones do país.", latitude: -22.9519, longitude: -43.2105),
    ]

    struct ContentView: View {
        
        @State private var posicao = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: 36.1069, longitude: -112.1129), span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30))
            )
        
        @State private var isSheetVisible = false
        @State private var dados: Location = arrayLocals[0]
        @State private var selectLocation = 0
        @State private var localSelected : Location = arrayLocals[0]
        
        var body: some View {
            ZStack{
                VStack{
                    ZStack{
                        Rectangle().frame(width: 200,height: 30)
                            .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                            .foregroundStyle(.yellow)
                        Picker(selection: $selectLocation, label: Text("Escolha um local")){
                                ForEach(0..<arrayLocals.count, id: \.self) { l in
                                    Text(arrayLocals[l].nome).tag(l)
                                }
                            }.zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            .onChange(of: selectLocation) {
                                posicao = MapCameraPosition.region(
                                    MKCoordinateRegion(
                                        center: CLLocationCoordinate2D(latitude: arrayLocals[$0].latitude,
                                                                        longitude: arrayLocals[$0].longitude),
                                        span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)
                                    )
                                )
                            }
                    }
                }
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                .offset(y: -340)

                Map(position: $posicao){
                    ForEach(arrayLocals, id: \.nome){l in
                        
                        Annotation(l.nome, 
                        coordinate: CLLocationCoordinate2D(latitude:l.latitude,
                                                           longitude: l.longitude)){
                            Button{
                                localSelected = l
                                isSheetVisible = true
                            } label: {
                                Image(systemName:"globe")
                                    .resizable()
                                    .frame(width: 44,height: 44)
                                    .clipShape(Circle())
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                }.ignoresSafeArea()
                 .sheet(isPresented: $isSheetVisible){
                     telaNova(selec: $localSelected)
            }
        }
    }

}

struct telaNova: View {
    
    @Binding var selec: Location
    
    var body: some View {
        ZStack(alignment: .top){
            Color.yellow.edgesIgnoringSafeArea(.all)
            VStack(){
                AsyncImage(url: URL(string: selec.foto)){ image in image
                        .resizable()
                        .frame(width: 200, height: 150)
                        .aspectRatio(contentMode: .fill)
                        .padding([.top], 30)
                } placeholder: {
                    Image(systemName: "photo.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 150)
                        .aspectRatio(contentMode: .fill)
                        .padding([.top], 30)
                }
                
                VStack{
                    Text(selec.nome)
                        .padding(40)
                        .foregroundColor(.brown)
                }
                
                ZStack{
                    
                    Rectangle()
                        .frame(width: 280, height: 400)
                        .foregroundColor(.brown)
                    
                    Text(selec.descricao)
                        .frame(width: 250, height: 380)
                        .multilineTextAlignment(.center)
                }
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}

#Preview {
    ContentView()
}

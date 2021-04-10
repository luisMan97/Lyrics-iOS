//
//  LyricsSearchView.swift
//  Lirycs-iOS
//
//  Created by Jorge Luis Rivera Ladino on 9/04/21.
//

import SwiftUI

struct LyricsSearchView: View {
    
    @ObservedObject var viewModel: LyricsSearchViewModel
    @State private var isShowingLyricsList = false
    
    var body: some View {
        NavigationView {
            LoadingView(isShowing: $viewModel.showProgress, text: viewModel.progressTitle) {
                VStack {
                    GenericTextFieldWithValidate(fieldName: "Artista", fieldValue: $viewModel.artist, fontWeight: .semibold,validationFormText: "El campo “Artista“ es obligatorio", showValidationForm: viewModel.showErrorArtistText, horizontalPadding: 38)
                    
                    GenericTextFieldWithValidate(fieldName: "Título de la canción", fieldValue: $viewModel.title, fontWeight:.semibold, validationFormText: "El campo “Título de la canción“ es obligatorio", showValidationForm: viewModel.showErrorTitleText, horizontalPadding: 38)
                    
                    GenericButtonView(text: "Buscar", borderColor: .colorPrimary, backgroundColor: .colorPrimary,horizontalPadding: 38, cornerRadius: 8) {
                        viewModel.searchLyrics()
                    }
                    
                    HStack {
                        if viewModel.showArtistNotFound {
                            Text("No se encontró resultados de la busqueda.")
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGray))
                                .padding(.horizontal)
                                .multilineTextAlignment(.center)
                                
                        } else if viewModel.lastLyric != nil {
                            viewModel.lastLyric.map { lastLyric in
                                VStack(spacing: 8) {
                                    Text("Última busqueda")
                                        .foregroundColor(Color(.systemGray))
                                        .font(.system(.title2, design: .rounded))
                                        .fontWeight(.bold)
                                    
                                    Text("\(viewModel.lastLyric?.title ?? "") - \(viewModel.lastLyric?.artist ?? "")")
                                        .foregroundColor(Color(.systemGray))
                                        .font(.system(.body, design: .rounded))
                                        .multilineTextAlignment(.center)
                                        .lineLimit(0)
                                        .padding(.horizontal)
                                    
                                    Button("Ver...") {
                                        viewModel.presentLyrics = true
                                    }.foregroundColor(.colorGreen)
                                }
                            }
                        }
                    }.padding(.top)
                    
                    
                    Spacer()
                    
                    NavigationLink(destination: LyricsListBuilder.createModule(), isActive: $isShowingLyricsList) {EmptyView() }
                }.padding(.top, 55)
            }.sheet(isPresented: $viewModel.presentLyrics) {
                viewModel.lastLyric.map { lyric in
                    VStack {
                        VStack {
                            HandleBar()
                                .padding(.top, 2)
                            
                            Text("\(lyric.title) - \(lyric.artist)")
                                .font(.system(.title, design: .rounded))
                                .multilineTextAlignment(.center)
                                .lineLimit(0)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                                
                            Divider()
                                .frame(height: 1)
                                .background(Color.colorPrimary)
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.colorPrimary)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            Text(lyric.lyricBody)
                                .padding()
                        }
                    }
                }
            }
            .alert(item: $viewModel.error) {
                Alert(
                    title: Text("Error"),
                    message: Text($0.message),
                    dismissButton: .default(Text("Ok"))
                )
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                                        isShowingLyricsList = true
                                    }, label: {
                                        Image(systemName: "music.note.list")
                                            .font(.title2)
                                    })
            )
            .navigationBarTitle("LyricsSearch")
            .onAppear {
                viewModel.getLastLyrics()
            }
        }
    }
    
}

struct LyricsSearchView_Previews: PreviewProvider {
    static var previews: some View {
        let managedContext = AppState.shared.databaseManager.managedContext
        
        LyricsSearchBuilder.createModule(managedContext: managedContext)
    }
}

struct HandleBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 70, height: 6)
            .foregroundColor(Color(.systemGray4))
            .cornerRadius(8)
    }
}

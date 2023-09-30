//
//  ContentView.swift
//  Pinch
//
//  Created by Simão Neves Samouco on 28/09/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PORPERTY
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var isDraweOpen: Bool = false
    
    let pages: [Page] = pagesData
    @State private var pageIndex: Int = 1
    
    // MARK: - FUNCTIONS
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    func currentPage() -> String {
        return pages[pageIndex - 1].imageName
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Color.clear
                // MARK: - PAGE IMAGE
                Image(currentPage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .animation(.linear(duration: 1), value: isAnimating)
                    .scaleEffect(imageScale)
                //: MARK: - 1. TAP GESTURE
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    })
                //MARK: - 2. Drag gesture
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = value.translation
                                }
                            }
                            .onEnded{ _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )
                // MARK: - 3. Magnification
                    .gesture(
                        MagnificationGesture()
                            .onChanged{ value in
                                withAnimation(.linear(duration: 1)) {
                                    if imageScale >= 1 && imageScale <= 5 {
                                        imageScale = value
                                    } else if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            }
                            .onEnded { _ in
                                if imageScale > 5 {
                                    imageScale = 5
                                } else if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )
            } //: zstack
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                isAnimating = true
            }
            //MARK: - Info Panel
            .overlay (
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                , alignment: .top
            )
            
            //MARK: - CONTROLS
            .overlay(
                Group {
                    HStack {
                        // SCALE DOWN
                        Button{
                            withAnimation(.spring()) {
                                if imageScale > 1 {
                                    imageScale -= 1
                                    
                                    if imageScale <= 1 {
                                        resetImageState()
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                                .font(.system(size: 36))
                        }
                        // RESET
                        Button{
                            resetImageState()
                        } label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                                .font(.system(size: 36))
                        }
                        
                        //SCALE UP
                        Button{
                            withAnimation(.spring()) {
                                if imageScale < 5 {
                                    imageScale += 1
                                    
                                    if imageScale >= 5 {
                                        imageScale = 5
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                                .font(.system(size: 36))
                        }
                        
                    }//: CONTROLS
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                }
                    .padding(),
                alignment: .bottom
            )
            //MARK: - DRAWER
            .overlay(
                HStack(spacing: 12) {
                    //MARK: - DRAWER HANDLE
                    Image(systemName: isDraweOpen ? "chevron.compact.right" : "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(8)
                        .foregroundStyle(.secondary)
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                isDraweOpen.toggle()
                            }
                        }
                    //MARK: - THUMBNAILS
                    ForEach(pages) { page in
                        Image(page.thumbnailName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                            .opacity(isDraweOpen ? 1 : 0)
                            .animation(.easeOut(duration: 0.5), value: isDraweOpen)
                            .onTapGesture {
                                isAnimating = true
                                pageIndex = page.id
                            }
                    }
                    Spacer()
                }//: DRAWER
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width: 260)
                    .padding(.top, UIScreen.main.bounds.height / 12)
                    .offset(x: isDraweOpen ? 20 : 215)
                , alignment: .topTrailing
            )
            
        } //: Navigation
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

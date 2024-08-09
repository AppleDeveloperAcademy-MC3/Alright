//
//  AppOnboardingView.swift
//  Alright
//
//  Created by 이상도 on 8/9/24.
//

import SwiftUI

struct AppOnboardingView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var isFirstLaunching: Bool
    
    private let totalPages = 4
    @State private var selectedPage = 0
    
    var body: some View {
        ZStack {
            Color.sgmGray2
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        isFirstLaunching = true
                        dismiss()
                    } label: {
                        Text("Skip")
                            .font(.Pretendard.Light.size17)
                            .foregroundColor(.sgmGrayA)
                    }
                    .padding(.trailing)
                    .opacity(selectedPage == 3 ? 0 : 1)
                }
                
                TabView(selection: $selectedPage) {
                    FirstOnboardingPageView()
                        .tag(0)
                    
                    SecondOnboardingPageView()
                        .tag(1)
                    
                    ThirdOnboardingPageView()
                        .tag(2)
                    
                    FourthOnboardingPageView(isFirstLaunching: $isFirstLaunching)
                        .tag(3)
                }
                .ignoresSafeArea()
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            
            // Indicator
            VStack {
                Spacer()
                
                HStack(spacing: 8) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(index == selectedPage ? .sgmBlue1 : .sgmBlue1.opacity(0.3))
                            .opacity(selectedPage == 3 ? 0 : 1)
                    }
                }
                .padding(.bottom, 40)
            }
        }
        .onAppear {
            isFirstLaunching = true
        }
    }
}

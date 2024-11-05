//
//  OnBoardingView.swift
//  Habito
//
//  Created by Temur Chitashvili on 05.11.24.
//

import SwiftUI

struct OnBoardingView: View {
    @StateObject var onBoardingViewModel: OnBoardingViewModel
    var body: some View {
        ZStack {
            Color
                .background
                .ignoresSafeArea()
            
            content
        }
    }
    
    private var content: some View {
        VStack {
            skipButton
            
            Spacer()
            
            pagesTabView
            
            Spacer()
            
            navigatorBullets
        }
        .padding(.horizontal, AppConstants.Paddings.medium)
    }
    
    private var skipButton: some View {
        HStack {
            Spacer()
            
            HBText(text: "Skip",
                   style: .body,
                   size: .medium,
                   font: nil,
                   textColor: .primaryText,
                   padding: nil,
                   multiLineAlignment: .center)
            .onTapGesture {
                withAnimation {
                    onBoardingViewModel.selectedPage = 2
                }
            }
        }
    }
    
    private var pagesTabView: some View {
        TabView(selection: $onBoardingViewModel.selectedPage) {
            firstPageContent
                .tag(0)
            Text("SSS")
                .tag(1)
            Text("SS2")
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    private var firstPageContent: some View {
        VStack(spacing: AppConstants.Paddings.small) {
            HBText(text: "Welcome to",
                   style: .title,
                   size: .large,
                   multiLineAlignment: .center)
            
            Image(.habitoMain)
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(AppConstants.CornerRadius.extraLarge)
            
            HBText(text: "🎉 We're excited to help you build healthy habits and achieve your goals. 💪✨ Let's get started on your journey to a more fulfilling life!",
                   style: .subtitle,
                   size: .small,
                   multiLineAlignment: .center)
        }
    }
    
    private var navigatorBullets: some View {
        VStack {
            HStack {
                ForEach(0..<3) { index in
                    Circle()
                        .frame(width: 14, height: 14)
                        .foregroundStyle(onBoardingViewModel.selectedPage == index ? .myPrimary : .clear)
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 1)
                                .foregroundStyle(.mySecondary)
                        }
                }
            }
            
            HBButton(title: onBoardingViewModel.selectedPage == 2 ? "Start" : "Next",
                     imageOnLeft: false,
                     style: .primary,
                     cornerRadius: AppConstants.CornerRadius.medium,
                     textFont: .body,
                     textWeight: .bold) {
                switch onBoardingViewModel.selectedPage {
                case 0:
                    withAnimation {
                        onBoardingViewModel.selectedPage += 1
                    }
                case 1:
                    withAnimation {
                        onBoardingViewModel.selectedPage += 1
                    }
                case 2:
                    //TODO: Navigation
                    print("Navigation")
                default:
                    break
                }
            }
        }
    }
    
}

#Preview {
    OnBoardingView(onBoardingViewModel: OnBoardingViewModel())
}

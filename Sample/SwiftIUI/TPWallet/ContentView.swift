//
//  ContentView.swift
//  TPWallet
//
//  Created by Sunku Sneha on 06/05/25.
//

import SwiftUI
import UIKit
import TerraPaySDK

struct ContentView: View {
   
    var body: some View {
        NavigationView {
            GeometryReader { _ in
                VStack(alignment: .center, spacing: 20) {
                    nameStack
                    balanceView
                    paypalServicesButton
                    Spacer()
                    powderedByLogo
                }.padding(30)
                    
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    Image("airtel")
                        .resizable()
                        .frame(width: 100, height: 50)
                        .foregroundStyle(.white)

                }
            })
                .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.primaryAirtel, for: .navigationBar)
        }
    }

    private func launchFramework() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let viewcontroller = windowScene.windows.first?.rootViewController else { return }
        let terraPaySDK = TerraPaySDK(controller: viewcontroller)
        terraPaySDK.msisdn = "254792474540"
        terraPaySDK.primaryColor = "EC1B24"
        terraPaySDK.secondaryColor = "FFFFFF"
        terraPaySDK.walletLogo = UIImage(named: "airtel")?.pngData()
        terraPaySDK.walletName = "KES"
        terraPaySDK.withdrawLabel = "Withdraw"
        terraPaySDK.topUpLabel = "Top Up"
        terraPaySDK.launch()
    }
}

extension ContentView {
    private var nameStack: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text("Hi, George Mbugua!")
                .font(.headline)
            Text("+254792474540")
                .font(.subheadline)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var balanceView: some View {
        VStack(alignment: .center, spacing: 12.0) {
            Text("Balance")
                .font(.headline)
            Text("10000.00 KES")
                .font(.title)
        }.frame(maxWidth: .infinity, alignment: .center)
            .padding(30)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(style: StrokeStyle(lineWidth: 1)))
    }
    
    private var paypalServicesButton: some View {
        Button(action: {
            launchFramework()
        }) {
            Text("Paypal Services")
                .fontWeight(.medium)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.black)
        .cornerRadius(8)
        .onOpenURL { url in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "terrapayConnectedRedirectNotification"), object: url)
        }
    }
    
    private var powderedByLogo: some View {
        HStack(alignment: .center, spacing: 3) {
            Text("Powered By")
                .tint(Color.powered)
                .font(.footnote)
            Image("terrapay")
                .resizable()
                .frame(width: 150, height: 30)
        }
    }
}

#Preview {
    ContentView()
}

//
//  TPDashboardViewController.swift
//  TPWallet
//
//  Created by Sneha Sunku on 21/06/24.
//

import UIKit
import TerraPaySDK

class TPDashboardViewController: UIViewController {
    
    static let identifier = "TPDashboardViewController"
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewBalance: UIView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblMSISDN: UILabel!
    @IBOutlet weak var lblBalance: UILabel!
    @IBOutlet weak var btnPayPal: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupUIElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblBalance.text = "10000.00 KES"
    }
    
    private func setupNavigationBar(with imageName: String?=nil) {
        
        let aspectRatio = 1.78
        let imgWidth = 40.0
        let imgViewTitle = UIImageView(image: UIImage(named: "airtel"))
        imgViewTitle.contentMode = .scaleAspectFill
        imgViewTitle.tintColor = .white
        
        let currWidth = imgViewTitle.widthAnchor.constraint(equalToConstant: imgWidth*aspectRatio)
        currWidth.isActive = true
        let currHeight = imgViewTitle.heightAnchor.constraint(equalToConstant: imgWidth)
        currHeight.isActive = true
        
        navigationItem.titleView = imgViewTitle
    }
    
    private func setupUIElements() {
        navigationItem.hidesBackButton = true
        view.backgroundColor = .primaryAirtel
        
        TPUtils.appDelegate?.dashboardVC = self
        lblUsername.text = "Hi, George Mbugua!"
        lblMSISDN.text = "+254792474540"
        viewBalance.setRadiusWithShadow()
    }
    
    @IBAction func handlePayPalServicesClicked(_ sender: Any) {
        
        if TPNetworkManager.networkStatus != .satisfied {
            TPNetworkManager.shared.showNoInternetAlert(with: self)
            return
        }
        
        let config = TerrapaySDKConfig(controller: self,
                                       dialCode: "+254",
                                       msisdn: "792474540",
                                       walletName: "Airtel Money Wallet",
                                       currency: "KES",
                                       countryCode: "KE",
                                       primaryColor: "EC1B24",
                                       secondaryColor: "FFFFFF",
                                       email: "test@test.com",
                                       topUpLabel: "Top-Up",
                                       withdrawLabel: "Withdraw",
                                       termsConditionsUrl: "")
        
        TerraPayClient.shared.launch(with: config) { result, error in
            switch result {
            case .success: print("SDK launched successfully")
            case .cancelled: print("User cancelled")
            case .failure: print("Error: \(error?.message ?? "")")
            @unknown default: fatalError()
            }
        }
    }
}

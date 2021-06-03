//
//  ViewController.swift
//  Berbix
//
//  Created by Eric Levine on 06/03/2021.
//  Copyright (c) 2021 Eric Levine. All rights reserved.
//
import UIKit
import Foundation
import Berbix

class ViewController: UIViewController, BerbixFlowDelegate {

    @IBOutlet weak var label: UILabel!

    var sdk = BerbixSDK()

    func completed() {
        label.isHidden = false
        label.text = "Completed successfully!"
    }

    func failed(error: BerbixError) {
        label.isHidden = false
        switch error {
        case .userExitError:
            label.text = "User exited flow."
        case .cameraAccessError:
            label.text = "You need to grant camera permissions to this app."
        default:
            label.text = "Something went wrong..."
        }
    }

    @IBAction func startFlowFromAPI(_ sender: Any) {
        let token = "<enter-your-token>" // MARK: ENTER TOKEN HERE
        let config = BerbixConfigurationBuilder()
            .withClientToken(token)
            .build()
        DispatchQueue.main.async {
            self.sdk.startFlow(self, delegate: self, config: config)
        }
    }
}

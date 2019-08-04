//
// Raivo OTP
//
// Copyright (c) 2019 Tijme Gommers. All rights reserved. Raivo OTP
// is provided 'as-is', without any express or implied warranty.
//
// This source code is licensed under the CC BY-NC 4.0 license found
// in the LICENSE.md file in the root directory of this source tree.
// 

import Foundation
import UIKit
import Spring
import SVGKit

class SetupEnableBiometricsViewController: UIViewController {
    
    @IBOutlet weak var viewIcon: SVGKFastImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        adjustViewToKeyboard()
        
        let url = Bundle.main.url(forResource: "biometric", withExtension: "svg", subdirectory: "Vectors")
        viewIcon.image = SVGKImage(contentsOf: url)
    }
    
    @IBAction func onDismissBiometric(_ sender: Any) {
        getAppDelegate().updateStoryboard()
    }
    
    @IBAction func onEnableBiometric(_ sender: Any) {
        StorageHelper.shared.setEncryptionKey(getAppDelegate().getEncryptionKey()!.base64EncodedString())
        
        if let _ = StorageHelper.shared.getEncryptionKey(prompt: "Confirm to enable biometric authentication") {
            StorageHelper.shared.setBiometricUnlockEnabled(true)
            getAppDelegate().updateStoryboard()
        }
    }
}

//
//  ViewController.swift
//  KVO-Project
//
//  Created by Maitree Bain on 4/7/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    private var fontSizeObservation: NSKeyValueObservation?
    private var iconNameObservation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureObserver()
    }

    private func configureObserver() {
        configureFontObserver()
        configureIconObservation()
    }
    
    private func configureFontObserver() {
        fontSizeObservation = Settings.shared.observe(\.fontsize, options: [.old, .new], changeHandler: { [weak self] (settings, change) in
            
            guard let newSize = change.newValue else { return }
            let fontSize = CGFloat(newSize)
            self?.welcomeLabel.font = UIFont.systemFont(ofSize: fontSize)
            
        })
    }
    
    private func configureIconObservation() {
        iconNameObservation = Settings.shared.observe(\.icon, options: [.old, .new], changeHandler: { [weak self] (settings, change) in
            
            guard let iconName = change.newValue else { return }
            
            self?.iconImage.image = UIImage(systemName: iconName)
        })
    }

    deinit {
        fontSizeObservation?.invalidate()
        iconNameObservation?.invalidate()
    }
}


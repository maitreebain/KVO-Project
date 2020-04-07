//
//  Settings.swift
//  KVO-Project
//
//  Created by Maitree Bain on 4/7/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import Foundation

//settings needs to be KVO compliant
@objc class Settings: NSObject {
    static let shared = Settings()
    @objc dynamic var fontsize: Int
    @objc dynamic var icon: String
    override private init() {
        fontsize = 17
        icon = "sun.haze.fill"
    }
}

//
//  CustomTabBarViewController.swift
//  Design+codeUIKit1
//
//  Created by 五十嵐伸雄 on 2024/02/11.
//

import UIKit

class CustomTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(named: "TabBarTint")!
        tabBar.layer.cornerRadius = 30
        tabBar.layer.masksToBounds = true
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.selectionIndicatorImage = UIImage(named: "Selected")
        additionalSafeAreaInsets.bottom = 20
    }
}

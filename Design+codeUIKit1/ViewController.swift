//
//  ViewController.swift
//  Design+codeUIKit1
//
//  Created by 五十嵐伸雄 on 2024/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var handbooksCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        handbooksCollectionView.delegate = self
        handbooksCollectionView.dataSource = self
        
//        cardView.layer.cornerRadius = 30
//        cardView.layer.cornerCurve = .continuous
//        blurView.layer.cornerRadius = 30
//        blurView.layer.cornerCurve = .continuous
//        
//        blurView.layer.masksToBounds = true
//        
//        cardView.layer.shadowColor = UIColor(named: "Shadow")?.cgColor
//        cardView.layer.shadowOpacity = 0.5
//        cardView.layer.shadowOffset = CGSize(width: 0, height: 10)
//        cardView.layer.shadowRadius = 20
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCell", for: indexPath) as! HandbookCollectionViewCell
        cell.titleLabel.text = "SWiftUI Handbook"
        cell.subtitleLabel.text = "20 HOURS - 30 SECTIONS"
        cell.descriptionLabel.text = "Learn about all the basics of SWift UI"
        cell.gradient.colors = [UIColor.red.cgColor, UIColor.systemPink.cgColor]
        cell.logo.image = UIImage(named: "Logo React")
        cell.banner.image = UIImage(named: "Illustration 2")
        return cell
    }
}

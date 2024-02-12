//
//  ExploreViewController.swift
//  Design+codeUIKit1
//
//  Created by 五十嵐伸雄 on 2024/02/12.
//

import UIKit

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var sectionsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionsCollectionView.delegate = self
        sectionsCollectionView.dataSource = self
        sectionsCollectionView.layer.masksToBounds = false
    }
}

extension ExploreViewController: UICollectionViewDelegate {
    
}

extension ExploreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SectionsCollectionViewCell.self), for: indexPath) as! SectionsCollectionViewCell
        let section = sections[indexPath.section]
        
        cell.titleLabel.text = section.sectionTitle
        cell.subtitleLabel.text = section.sectionSubtitle
        cell.banner.image = section.sectionBanner
        cell.logo.image = section.sectionIcon
        return cell
    }
}

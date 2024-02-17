//
//  ExploreViewController.swift
//  Design+codeUIKit1
//
//  Created by 五十嵐伸雄 on 2024/02/12.
//

import UIKit
import Combine

class ExploreViewController: UIViewController {
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var sectionsCollectionView: UICollectionView!
    @IBOutlet weak var topicsTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionsCollectionView.delegate = self
        sectionsCollectionView.dataSource = self
        sectionsCollectionView.layer.masksToBounds = false
        
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.layer.masksToBounds = false
        
        topicsTableView.delegate = self
        topicsTableView.dataSource = self
        topicsTableView.layer.masksToBounds = false
        topicsTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
    }
}

extension ExploreViewController: UICollectionViewDelegate {
    
}

extension ExploreViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sectionsCollectionView {
            return sections.count
        } else {
            return handbooks.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sectionsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SectionsCollectionViewCell.self), for: indexPath) as! SectionsCollectionViewCell
            let section = sections[indexPath.section]
            
            cell.titleLabel.text = section.sectionTitle
            cell.subtitleLabel.text = section.sectionSubtitle
            cell.banner.image = section.sectionBanner
            cell.logo.image = section.sectionIcon
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HandbookCollectionViewCell.self), for: indexPath) as! HandbookCollectionViewCell
            let handbook = handbooks[indexPath.item]
            
            cell.titleLabel.text = handbook.courseTitle
            cell.subtitleLabel.text = handbook.courseSubtitle
            cell.descriptionLabel.text = handbook.courseDescription
            cell.gradient.colors = handbook.courseGradient
            cell.logo.image = handbook.courseIcon
            cell.banner.image = handbook.courseBanner
            return cell
        }
    }
}

extension ExploreViewController: UITableViewDelegate {
    
}

extension ExploreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TopicsTableViewCell.self), for: indexPath) as! TopicsTableViewCell
        let topic = topics[indexPath.row]
        cell.titleLabel.text = topic.topicName
        cell.topicIcon.image = UIImage(systemName: topic.topicSymbol)!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

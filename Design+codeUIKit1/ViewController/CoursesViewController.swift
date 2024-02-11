//
//  CoursesViewController.swift
//  Design+codeUIKit1
//
//  Created by 五十嵐伸雄 on 2024/02/03.
//

import UIKit
import Combine

class CoursesViewController: UIViewController {
    var course: Course?
    
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
//    @IBOutlet weak var iconImageView: CustomImageView!
    @IBOutlet weak var sectionsTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    private var tokens: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionsTableView.delegate = self
        sectionsTableView.dataSource = self
        
        sectionsTableView.publisher(for: \.contentSize)
            .sink { newContentSize in
                self.tableViewHeight.constant = newContentSize.height
            }
            .store(in: &tokens)
        
//        iconImageView.image = course?.courseIcon
        bannerImage.image = course?.courseBanner
        backgroundImage.image = course?.courseBackground
        titleLabel.text = course?.courseTitle
        subtitleLabel.text = course?.courseSubtitle
        descriptionLabel.text = course?.courseDescription
        authorLabel.text = "Taught by \(course?.courseAuthor?.formatted(.list(type: .and, width: .standard)) ?? "Design+Code")"
    }
    @IBAction func closeButtonDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension CoursesViewController: UITableViewDelegate {
    
}

extension CoursesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        course?.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SectionTableViewCell.self), for: indexPath) as! SectionTableViewCell
        if let selectedCourse = course {
            let selectedSection = selectedCourse.sections?[indexPath.row]
            cell.titleLabel.text = selectedSection?.sectionTitle
            cell.subtitleLabel.text = selectedSection?.sectionSubtitle
            cell.descriptionLabel.text = selectedSection?.sectionDescription
            cell.logoImage.image = selectedSection?.sectionIcon
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    }
}

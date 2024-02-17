//
//  TopicsTableViewCell.swift
//  Design+codeUIKit1
//
//  Created by 五十嵐伸雄 on 2024/02/12.
//

import UIKit

class TopicsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topicIcon: CustomImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

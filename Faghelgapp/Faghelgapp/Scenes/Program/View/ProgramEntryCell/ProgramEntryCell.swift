//
//  ProgramEntryCell.swift
//  Faghelgapp
//
//  Created by Anders Ullnæss on 27/09/16.
//  Copyright © 2016 Idar Vassdal. All rights reserved.
//

import Foundation
import UIKit

class ProgramEntryCell: NibDesignableTableViewCell {

    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventStartTimeLabel: UILabel!
    @IBOutlet weak var eventAuthorLabel: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        initView()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initView()
    }

    private func initView() {
        eventTitleLabel.textColor = UIColor.mesanBlue
        eventTitleLabel.font = UIFont.listTitleFont()

        eventStartTimeLabel.textColor = UIColor.mesanGrey
        eventStartTimeLabel.font = UIFont.h1Font()

        eventAuthorLabel.textColor = UIColor.mesanGrey
        eventAuthorLabel.font = UIFont.undertekstFont()
    }

    func populate(event: Event) {
        eventTitleLabel.text = event.title
        eventStartTimeLabel.text = event.start.🕗()
        if let hostNames = event.hostNames {
            eventAuthorLabel.text = hostNames
        } else {
            eventAuthorLabel.text = " "
        }
    }
}

//
//  FactsTableViewCell.swift
//  ProficiencyExercise
//
//  Created by Poonam More on 21/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import UIKit

class FactsTableViewCell: UITableViewCell {
    
    // MARK: - Cell Elements intialization
     let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.green
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
     let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.lineBreakMode = .byWordWrapping
        lbl.sizeToFit()
        return lbl
    }()
     var factsImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(factsImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        setConstraintsToViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Placeholder image
    override func prepareForReuse() {
        factsImage.image = UIImage(named: "placeholder")
    }
    func setConstraintsToViews() {
        //Image constraits setup
        factsImage.topAnchor(top: topAnchor, padding: -20, enableInsets: false)
        factsImage.bottomAnchor(bottom: bottomAnchor, padding: -20, enableInsets: false)
        factsImage.leftAnchor(left: leftAnchor, padding: 5)
        factsImage.rightAnchor(right: nil, padding: 0)
        factsImage.widthAnchor(width: 80)
        factsImage.heightAnchor(height: 80)
        //Title label constraits setup
        titleLabel.topAnchor(top: topAnchor, padding: 20, enableInsets: false)
        titleLabel.bottomAnchor(bottom: nil, padding: 0, enableInsets: false)
        titleLabel.leftAnchor(left: factsImage.rightAnchor, padding: 10)
        titleLabel.rightAnchor(right: nil, padding: 0)
        titleLabel.widthAnchor(width: 0)
        titleLabel.heightAnchor(height: 0)
        //Description label contraints setup
        descriptionLabel.topAnchor(top: titleLabel.bottomAnchor, padding: 0, enableInsets: false)
        descriptionLabel.bottomAnchor(bottom: bottomAnchor, padding: 20, enableInsets: false)
        descriptionLabel.leftAnchor(left: factsImage.rightAnchor, padding: 10)
        descriptionLabel.rightAnchor(right: rightAnchor, padding: 20)
        descriptionLabel.widthAnchor(width: 0) //frame.size.width)
        descriptionLabel.heightAnchor(height: 0)
    }
    // MARK: Data population of cell
    var rowsModel: Rows! {
        didSet {
            factsImage.downloaded(from: rowsModel.imageHref ?? "", contentMode: .scaleAspectFit)
            titleLabel.text = rowsModel.title
            descriptionLabel.text = rowsModel.description
        }
    }
}

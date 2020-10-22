//
//  FactsTableViewCell.swift
//  ProficiencyExercise
//
//  Created by Poonam More on 21/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import UIKit

class FactsTableViewCell: UITableViewCell {
    
    //MARK: Cell Elements intialization
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
    
    //MARK: -Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(factsImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        factsImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 90, height: 90, enableInsets: false)
        titleLabel.anchor(top: topAnchor, left: factsImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: factsImage.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 50, paddingRight: 20, width: frame.size.width , height: 0, enableInsets: false)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    //MARK: -Placeholder image
    override func prepareForReuse() {
        factsImage.image = UIImage(named: "placeholder")
    }
    
    //MARK: Data population of cell
    var factViewModel: FactsViewModel! {
        didSet {
            factsImage.downloaded(from: factViewModel.factimage ?? "", contentMode: .scaleAspectFit)
            titleLabel.text = factViewModel.factTitle
            descriptionLabel.text = factViewModel.factDescription
            
        }
    }
}

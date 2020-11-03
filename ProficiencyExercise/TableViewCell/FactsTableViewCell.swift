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
  var allConstraints: [NSLayoutConstraint] = []
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
  // MARK: - Constraints setup using VFL
  func setConstraintsToViews() {
    let viewsDictionary = ["factsImage": factsImage, "titleLabel": titleLabel, "descriptionLabel": descriptionLabel]
    let factsImageInsets = factsImage.safeAreaInsets
    let metrics1 = ["topMargin": factsImageInsets.top,
                    "leftMargin": factsImageInsets.left]
    factsImage.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    let imageVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-[factsImage(90)]",
      metrics: metrics1,
      views: viewsDictionary)
    allConstraints += imageVerticalConstraints
    let titleLabelVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-[titleLabel(30)]",
      metrics: nil,
      views: viewsDictionary)
    allConstraints += titleLabelVerticalConstraints
    let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-5-[factsImage(90)]-20-[titleLabel]-|",
      metrics: nil,
      views: viewsDictionary)
    allConstraints += topRowHorizontalConstraints
    let summaryToPageVerticalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:[titleLabel]-[descriptionLabel]-50-|",
      metrics: nil,
      views: viewsDictionary)
    allConstraints += summaryToPageVerticalConstraints
    let bottomRowHorizontalConstraints = NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-5-[factsImage(90)]-20-[descriptionLabel(200)]-|",
      metrics: nil,
      views: viewsDictionary)
    allConstraints += bottomRowHorizontalConstraints
    NSLayoutConstraint.activate(allConstraints)
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

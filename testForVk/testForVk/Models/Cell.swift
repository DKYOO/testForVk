//
//  Cell.swift
//  testForVk
//
//  Created by Dmitry Kaveshnikov on 13/7/22.
//

import Foundation
import UIKit

protocol Configurable {
    associatedtype Model
    func configure(model: Model)
}

final class Cell: UITableViewCell {
    // MARK: Static
    static let identifier = K.reuseCellName
    
    // MARK: Properties
    private let name: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let descript: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    // MARK: Setup
    private func setupView() {
        contentView.addSubview(image)
        contentView.addSubview(name)
        contentView.addSubview(descript)
        
        contentView.backgroundColor = .systemBlue
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            image.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            image.widthAnchor.constraint(equalToConstant: 100),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            name.topAnchor.constraint(equalTo: contentView.topAnchor),
            name.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 20),
            name.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            name.heightAnchor.constraint(equalTo: image.heightAnchor, multiplier: 0.5),
            
            descript.topAnchor.constraint(equalTo: name.bottomAnchor),
            descript.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 20),
            descript.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            descript.heightAnchor.constraint(equalTo: image.heightAnchor, multiplier: 0.5),
            descript.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
   
        ])
    }
}

// MARK: - Configurable
extension Cell: Configurable {
    struct Model {
        let name: String
        let description: String
        let image: UIImageView
    }
    
    func configure(model: Model) {
        name.text = model.name
        descript.text = model.description
    }
}

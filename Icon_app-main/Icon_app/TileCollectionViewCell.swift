//
//  TileCollectionViewCell.swift
//  Icon_app
//
//  Created by Gabriel Batista Cristiano on 02/06/21.
//

import UIKit

struct TileCollectionViewCellViewModel {
    let name: String
    let backgroundColor: UIColor
    let imageName: String!
    
}

class TileCollectionViewCell: UICollectionViewCell {
    static let identifier = "TileCollectionViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1.0)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .regular)
        return label
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 48, y: 370, width: 150, height: 80)
        
    }
    
    func configure(with viewModel: TileCollectionViewCellViewModel) {
        contentView.backgroundColor = viewModel.backgroundColor
        label.text = viewModel.name
        contentView.layer.cornerRadius = 40
        let imageView = UIImageView(frame: contentView.bounds)
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: viewModel.imageName)
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        
    }
    
    
}

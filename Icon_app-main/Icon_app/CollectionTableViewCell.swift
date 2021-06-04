//
//  CollectionTableViewCell.swift
//  Icon_app
//
//  Created by Gabriel Batista Cristiano on 02/06/21.
//

import UIKit

struct CollectionTableViewCellViewModel {
    let viewModels: [TileCollectionViewCellViewModel]
}

protocol CollectionTableViewCellDelegate: AnyObject {
    func CollectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel)
}

class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let identifier = "CollectionTableViewCell"
    
    weak var delegate: CollectionTableViewCellDelegate?
    
    private var viewModels: [TileCollectionViewCellViewModel] = []
    
    private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 30
    layout.sectionInset = UIEdgeInsets(top: 10  , left: 30, bottom: 10, right: 10)
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: layout
    )
    collectionView.register(TileCollectionViewCell.self, forCellWithReuseIdentifier: TileCollectionViewCell.identifier)
    collectionView.backgroundColor = .systemBackground
    return collectionView
    }()
    
    // Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = CGRect(x: 0, y: 10, width: 450, height: 470)
    }
    
    // CollectionVIew
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TileCollectionViewCell.identifier,
            for: indexPath) as? TileCollectionViewCell else {
                fatalError()
            }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    func configure(with viewModel: CollectionTableViewCellViewModel) {
        self.viewModels = viewModel.viewModels
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let viewModel = viewModels[indexPath.row]
        
        delegate?.CollectionTableViewCellDidTapItem(with: viewModel)
    }
}

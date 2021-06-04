//
//  ViewController.swift
//  Icon_app
//
//  Created by Gabriel Batista Cristiano on 02/06/21.
//

import UIKit

class ThemeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CollectionTableViewCell.self,
                       forCellReuseIdentifier: CollectionTableViewCell.identifier)
        return table
    }()
    
    private let viewModels: [CollectionTableViewCellViewModel] = [
        CollectionTableViewCellViewModel(
            viewModels: [
                TileCollectionViewCellViewModel(name: "Unidade", backgroundColor: .systemBackground, imageName: "weight1"),
                TileCollectionViewCellViewModel(name: "Brevidade", backgroundColor: .systemBackground, imageName: "weight2"),
                TileCollectionViewCellViewModel(name: "Alinhamento", backgroundColor: .systemBackground, imageName: "weight3"),
                TileCollectionViewCellViewModel(name: "", backgroundColor: .systemBackground, imageName: ""),
        ])
    ]

    @IBOutlet var labelTitulo: UILabel!
    @IBOutlet var myButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        labelTitulo.adjustsFontSizeToFitWidth = true
        labelTitulo.textColor = .label
        view.addSubview(labelTitulo)
        
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: 200, width: 400, height: 500)
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CollectionTableViewCell.identifier,
                for: indexPath) as? CollectionTableViewCell else {
            fatalError()
        }
        cell.delegate = self
        cell.configure(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.width + 200
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(viewModels[indexPath.row])
    }

}


extension ThemeViewController: CollectionTableViewCellDelegate{
    func CollectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel) {
        if viewModel.name == "Unidade"{
            performSegue(withIdentifier: "mySegue", sender: nil)
        }; if viewModel.name == "Brevidade" {
            performSegue(withIdentifier: "mySegue2", sender: nil)
        }; if viewModel.name == "Alinhamento" {
            performSegue(withIdentifier: "mySegue3", sender: nil)
        }
    }
}



//
//  ViewController.swift
//  testForVk
//
//  Created by Dmitry Kaveshnikov on 13/7/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var arr: [Model] = []
    
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkService.shared.loadJson { _ in }
        setupView()
        setupTableView()
        arr = getArray(model: Services)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.rowTapped))
        tableView.addGestureRecognizer(tap)
    }
    
    private func setupView() {
        view.backgroundColor = .black
        title = K.title
        view.addSubview(tableView)
        tableView.rowHeight = 80
        tableView.pin(to: view)
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(Cell.self, forCellReuseIdentifier: K.reuseCellName)
        tableView.backgroundColor = .black
        tableView.separatorStyle = .singleLine
    }
    
    @objc private func rowTapped(sender: UITapGestureRecognizer) {
//         guard let text = searchTextField.text else {
//             return
//         }
//         print(text)
     }
    
    func getArray(model: Services) -> Model {
        let modelOne = Model(name: model.name, description: model.description, image: model.icon_url)
        return modelOne
    }
  
}

extension ViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.reuseCellName) as? Cell
        else { fatalError() }
        
//        let element = arr[indexPath.row]
        
//        cell.configure(model: .init(name: "hello" , description: "Worlk", image: imageToModel))
//        cell.selectionStyle = .gray
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .black
        cell.tintColor = .gray
        return cell
    }
}




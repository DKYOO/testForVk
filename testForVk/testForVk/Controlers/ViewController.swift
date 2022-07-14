//
//  ViewController.swift
//  testForVk
//
//  Created by Dmitry Kaveshnikov on 13/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkService.shared.loadJson { _ in }
        setupView()
        setupTableView()
        
    }
    
    private func setupView() {
        view.backgroundColor = .black
        self.title = K.title
        view.addSubview(tableView)
        tableView.pin(to: view)
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(Cell.self, forCellReuseIdentifier: K.reuseCellName)
        
        
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource  {

    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            array.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard
                let cell = tableView.dequeueReusableCell(withIdentifier: K.reuseCellName) as? Cell
            else {
                fatalError()
            }
            
            let element = array[indexPath.row]
            
            cell.configure(
                model: .init(text: element)
            )
            cell.selectionStyle = .none
            return cell
        }
    }
    
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
    

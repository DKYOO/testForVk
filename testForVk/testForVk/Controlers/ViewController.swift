//
//  ViewController.swift
//  testForVk
//
//  Created by Dmitry Kaveshnikov on 13/7/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var arrayWithBullshit: [Services] = []
    var counter: Int = 1
    
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        print("3")
        super.viewDidLoad()
        setupView()
        fetch()
        setupTableView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.rowTapped))
        tableView.addGestureRecognizer(tap)
    }
    
    func fetch() {
            NetworkService.shared.loadJson { result in
                switch result {
                case .success(let data):
                    print("+++++++++++++++++++++++++")
                    print("Success")
                    self.arrayWithBullshit = data.body.services
                    self.counter = data.body.services.count
                    print(self.arrayWithBullshit)
                    print(self.counter)
                    DispatchQueue.main.async { self.tableView.reloadData() }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    private func setupView() {
        view.backgroundColor = .black
        title = K.title
        view.addSubview(tableView)
        tableView.pin(to: view)
    }
    
    private func setupTableView() {
        print("2")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(Cell.self, forCellReuseIdentifier: K.reuseCellName)
        tableView.backgroundColor = .black
        tableView.separatorStyle = .singleLine
    }
    
    @objc private func rowTapped(sender: UITapGestureRecognizer) {

     }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.reuseCellName) as? Cell
        else { fatalError() }
        
        let element = arrayWithBullshit[indexPath.row]
        cell.configure(model: .init(name: element.name, description: element.description, image: element.icon_url))
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .black
        cell.tintColor = .black
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("1")
        return arrayWithBullshit.count
    }
}




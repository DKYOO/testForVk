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
    var deepLink: String = ""
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetch()
        setupTableView()
    }
    
    func fetch() {
            NetworkService.shared.loadJson { result in
                switch result {
                case .success(let data):
                    self.arrayWithBullshit = data.body.services
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(Cell.self, forCellReuseIdentifier: K.reuseCellName)
        tableView.backgroundColor = .black
        tableView.separatorStyle = .singleLine
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
        return arrayWithBullshit.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let appUrl = URL(string: arrayWithBullshit[indexPath.row].link) else { return }
        if UIApplication.shared.canOpenURL(appUrl) {
            UIApplication.shared.open(appUrl)
        } else {
            UIApplication.shared.open(appUrl)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}




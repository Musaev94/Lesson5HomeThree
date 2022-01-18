//
//  ViewController.swift
//  Lesson5HomeThree
//
//  Created by user on 10/1/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource {
    
    private lazy var tableView: UITableView = {
        var view = UITableView()
        view.dataSource = self
        return view
    }()
    
    private lazy var textField: UITextField = {
        var view = UITextField()
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 25
        view.textColor = .white
        view.textAlignment = .center
        return view
    }()
    
    private lazy var buttonSearch: UIButton = {
        var view = UIButton(type: .system)
        view.backgroundColor = .systemRed
        view.setTitleColor(.white, for: .normal)
        view.setTitle("Search", for: .normal)
        view.layer.cornerRadius = 25
        view.addTarget(nil, action: #selector(ClickButton(view: )), for: .touchUpInside)
        return view
    }()
    
    private var names = ["Abay", "Rasya", "Meder", "Ruslan", "Beka", "Adilet", "Zakir", "Dair", "Tema", "Jan"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewConstr()
    }
    
    @objc func ClickButton(view: UIButton) {
        
        let indexChislo = self.names.firstIndex(of: textField.text ?? "")

        if indexChislo != nil {
            self.names.remove(at: indexChislo ?? 0)
        }
        
        self.tableView.reloadData()
        
        textField.text = ""
    }
    
    private func viewConstr() {
        view.addSubview(buttonSearch)
        buttonSearch.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.left.equalToSuperview().inset(10)
            make.height.width.equalTo(100)
        }
        
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.left.equalTo(buttonSearch.snp.right).offset(20)
            make.right.equalToSuperview().inset(10)
            make.height.width.equalTo(100)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.right.left.bottom.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = names[index]
        
        return cell
    }

    func comp(_ a: [Int], _ b: [Int]) -> Bool {
      var newB: [Int] = []
      var newA: [Int] = a
      
      b.forEach { item in newB.append(item / 2) }
      
      newB.sorted()
      newA.sorted()
      
      return newA == newB
    }


}


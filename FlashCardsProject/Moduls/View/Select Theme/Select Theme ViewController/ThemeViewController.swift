//
//  ThemeViewController.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 31.07.2021.
//

import UIKit

class ThemeViewController: UIViewController {

    private var viewModel: ThemeViewModelType? //protocol dlya TB
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ThemeViewModel()
        setTableView()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .done, target: self, action: #selector(addNewTheme))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
}

extension ThemeViewController: UITableViewDataSource, UITableViewDelegate {
    
    @objc func addNewTheme() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewThemeViewController") as! NewThemeViewController
        show(vc, sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ThemeTableViewCell.typeName, for: indexPath) as! ThemeTableViewCell
        cell.labelTitle.text = SingleTon.shared.themes[indexPath.row].name
        
        return cell
    }
    
    private func setTableView() {
        self.tableView.register(ThemeTableViewCell.self, forCellReuseIdentifier: ThemeTableViewCell.typeName)
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.separatorStyle = .none
        
    }
    
}

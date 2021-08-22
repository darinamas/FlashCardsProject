//
//  ViewController.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 26.07.2021.
//

import UIKit
// Делегатор
// Primajet dannye
class MainViewController: UIViewController {
    
    var viewModel: HomeViewViewModelType? //WEAK??   delegat, protocol dlya TB
    
    @IBOutlet weak var tableViewForCards: UITableView!
    @IBOutlet weak var collectionViewForTags: UICollectionView!
    let startButton = UIButton()
    let buttomView = UIView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.viewModel = MainViewModel() //delegat
        viewModel?.delegate = self  //delegatom dla vievModel budet vystupat self=MainViewController
        setTableView()
        setCollectionView()
        setButtomView()
        setStartBtn()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableViewForCards.reloadData()
        
    }
}

//MARK: Extension
extension MainViewController: UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
   
    @IBAction func addNewCard(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewCardViewController") as! NewCardViewController
        show(vc, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.typeName, for: indexPath) as! CardTableViewCell
        cell.labelTitle.text = SingleTon.shared.cards[indexPath.row].question
        
        return cell
    }
    
    private func setTableView() {
        self.tableViewForCards.register(CardTableViewCell.self, forCellReuseIdentifier: CardTableViewCell.typeName)
        tableViewForCards.dataSource = self
        tableViewForCards.delegate = self
        self.tableViewForCards.separatorStyle = .none
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath as IndexPath) as! TagsCollectionViewCell
        
        cell.backgroundColor = .blue
        return cell
    }
    
    private func setCollectionView() {
        self.collectionViewForTags.register(TagsCollectionViewCell.self, forCellWithReuseIdentifier: "TagCell")
        collectionViewForTags.dataSource = self
        collectionViewForTags.delegate = self
    }
    
    
    //MARK: Start Btn customize
    private func setStartBtn() {
        
        startButton.backgroundColor = .blue
        startButton.setTitle("Start test", for: .normal)
        startButton.layer.cornerRadius = 30
        startButton.frame = CGRect(x: view.frame.minX + 120,
                                   y: view.frame.maxY - 120,
                                   width: 150,
                                   height: 80)
        view.addSubview(startButton)
        startButton.addTarget(self, action: #selector(startTestBtnAction), for: .touchUpInside)
    }
    
    private func setButtomView() {
        buttomView.backgroundColor = .darkGray
        buttomView.frame = CGRect(x: view.frame.minX,
                                   y: view.frame.maxY - 150,
                                   width: view.frame.maxX,
                                   height: 150)
        view.addSubview(buttomView)
    }
    
    //MARK: Start button action
    @objc func startTestBtnAction() {
        //        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        //        let viewController = storyboard?.instantiateViewController(withIdentifier: "StartTest") as! StartTestViewController
        //        show(viewController, sender: nil)
 
        viewModel?.start()
     
    }
}

extension MainViewController: MainViewModelDelegate { //realizujet func Protocola  MainViewModelDelegate
    
    func showAlert() {
        let alert = UIAlertController(title: "Did you bring your towel?", message: "It's recommended you bring your towel before continuing.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
}


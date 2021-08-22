//
//  NewThemeViewController.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 31.07.2021.
//

import UIKit
import SnapKit

//Degegator
// Pri sozdanii objekta nuzno ponyat budet li nasledovat etot object
// Esli NET nasledovanya - final - zapreswaet nasledovanie classa. + Bystree rabotajet. ne sozdaet dop mesto v pamayti
//Lazy stavitsya pered var, init proischodit tolko kogda nuzno, kogda obrawaemsya k peremennoj
final class NewThemeViewController: UIViewController {
    
    //MARK: - Private properties
    
    private var viewModel: NewThemeViewModelType? //protocol
    private lazy var mainView = UIView()
    private lazy var labelTitle = UILabel()
    private lazy var textFieldForTitle = UITextView()
    private lazy var colorMarkRed = UIButton()
    private lazy var colorMarkBlue = UIButton()

    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = NewThemeViewModel() //delegat
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveNewTheme))
        addSubviews ()
        runSnapKitLayout()
    }
    
}

extension NewThemeViewController {
    
    //MARK: 'Add Theme' Btn action
    
    @objc func saveNewTheme() {
        if textFieldForTitle.text != "" {
            let theme = Themes(name: textFieldForTitle.text, color: .blue, id: "5")
            viewModel?.addNewTheme(theme: theme)
            //let _ = UIStoryboard(name: "Main", bundle: nil) //storyboard
            let vc = storyboard?.instantiateViewController(withIdentifier: "ThemeViewController") as! ThemeViewController
            show(vc, sender: nil)
        }
    }
    
    private func addSubviews () {
        mainView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        view.addSubview(mainView)
        
        labelTitle.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelTitle.text = "Theme Title"
        mainView.addSubview(labelTitle)
        
        textFieldForTitle.layer.cornerRadius = 15
        mainView.addSubview(textFieldForTitle)
        
        colorMarkRed.backgroundColor = .red
        colorMarkRed.layer.cornerRadius = 15
        mainView.addSubview(colorMarkRed)
        
        colorMarkBlue.backgroundColor = .blue
        colorMarkBlue.layer.cornerRadius = 15
        mainView.addSubview(colorMarkBlue)
        
    }
    
    private func  runSnapKitLayout() {
        
        mainView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(95)
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            
        }
        
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalTo(mainView).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.leading.equalTo(50)
            
        }
        textFieldForTitle.snp.makeConstraints { (make) in
            make.top.equalTo(mainView).offset(70)
            make.height.equalTo(200)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            
        }
        
        colorMarkRed.snp.makeConstraints { (make) in
            make.top.equalTo(mainView).offset(300)
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.leading.equalTo(50)
            
        }
        
        colorMarkBlue.snp.makeConstraints { (make) in
            make.top.equalTo(mainView).offset(300)
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.leading.equalTo(90)
            
        }
        
    }
}



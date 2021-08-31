//
//  NewCardViewController.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 30.07.2021.
//

import UIKit

final class NewCardViewController: UIViewController {
    
    private var viewModel: NewCardViewViewModelType?  //protocol
    
    let mainView = UIView()
    let labelQuestion = UILabel()
    let textFieldForQuestion = UITextView()
    let labelAnswer = UILabel()
    let textFieldForAnswer = UITextView()
    let addThemeButton = UIButton()
    
    var textForEditQuestion = ""
    var textForEditAnswer = ""
    var indexPathForEdit = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = NewCardViewModel() //delegat
        viewModel?.delegate = self
        
        setNavigationContorller()
        addSubviews ()
        runSnapKitLayout()
        showText()
        
        print(SingleTon.shared.editFlag)
    }
    
}


extension NewCardViewController {
    
    func setNavigationContorller() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveBtn))
        self.addThemeButton.addTarget(self, action: #selector(addNewTheme), for: .touchUpInside)
    }
    
    
    //MARK: 'Add Theme' Btn action
    
    @objc func addNewTheme() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard?.instantiateViewController(withIdentifier: "ThemeViewController") as! ThemeViewController
        show(vc, sender: nil)
    }
    
    //MARK: 'Save btn' action
    
    @objc func saveBtn(sender: UIBarButtonItem) {
        SingleTon.shared.editFlag == true ? saveEditedCard() : saveNewCard()
        
    }
    
    func saveEditedCard() {
        SingleTon.shared.cards[indexPathForEdit].question = textFieldForQuestion.text
        SingleTon.shared.cards[indexPathForEdit].answer = textFieldForAnswer.text
        
        showMainVC()
    }
    
    func saveNewCard()  {
        if textFieldForQuestion.text != "" && textFieldForAnswer.text != "" {
            let card = Cards(question: textFieldForQuestion.text,
                             answer: textFieldForAnswer.text,
                             id:"45",
                             tag: Themes(name: "Dev", color: .blue, id: "45"),
                             wasEdit: false
            )
            
            viewModel?.addNewCard(card: card)
           
            showMainVC()
        }
    }
    
    private func showMainVC() {
        navigationController?.popViewController(animated: true)
    }
    private func showText() {
        textFieldForQuestion.text = textForEditQuestion
        textFieldForAnswer.text = textForEditAnswer
    }
    
    private func addSubviews () {
        mainView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        view.addSubview(mainView)
        
        labelQuestion.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelQuestion.text = "Question"
        mainView.addSubview(labelQuestion)
        
        textFieldForQuestion.layer.cornerRadius = 15
        mainView.addSubview(textFieldForQuestion)
        
        labelAnswer.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        labelAnswer.text = "Answer"
        mainView.addSubview(labelAnswer)
        
        textFieldForAnswer.layer.cornerRadius = 15
        mainView.addSubview(textFieldForAnswer)
        
        addThemeButton.backgroundColor = .blue
        addThemeButton.setTitle("Select Theme", for: .normal)
        addThemeButton.layer.cornerRadius = 30
        mainView.addSubview(addThemeButton)
    }
    
    private func  runSnapKitLayout() {
        
        mainView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(95)
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            
        }
        
        labelQuestion.snp.makeConstraints { (make) in
            make.top.equalTo(mainView).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.leading.equalTo(50)
            
        }
        textFieldForQuestion.snp.makeConstraints { (make) in
            make.top.equalTo(mainView).offset(70)
            make.height.equalTo(200)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            
        }
        labelAnswer.snp.makeConstraints { (make) in
            make.top.equalTo(mainView).offset(280)
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.leading.equalTo(50)
            
        }
        textFieldForAnswer.snp.makeConstraints { (make) in
            make.top.equalTo(mainView).offset(340)
            make.height.equalTo(200)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            
        }
        
        addThemeButton.snp.makeConstraints { (make) in
            make.top.equalTo(mainView).offset(600)
            make.height.equalTo(80)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            
        }
        
    }
    
    
}

extension NewCardViewController: NewCardViewModelDelegate {
    
    func a() {
        print("a")
    }
}

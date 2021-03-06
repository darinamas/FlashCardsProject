//
//  CardTableViewCell.swift
//  FlashCardsProject
//
//  Created by Daryna Polevyk on 26.07.2021.
//

import UIKit
import SnapKit

final class CardTableViewCell: UITableViewCell {
    
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        return view
    }()
    
    let viewForCell: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.layer.cornerRadius = 30
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowOffset = CGSize(width: 10,
                                              height: 10)
        view.layer.shadowRadius = 5
        return view
    }()
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubViews()
        runSnapKitLayout()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: Added subviews
    
    private func addSubViews() {
        addSubview(mainView)
        mainView.addSubview(viewForCell)
        viewForCell.addSubview(labelTitle)
    }
    
//MARK: SnapKit AutoLayout
    
   private func runSnapKitLayout() {

        mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()

        }
        viewForCell.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.edges.equalTo(mainView).multipliedBy(0.85)
            make.leading.equalTo(mainView).offset(50)
            make.trailing.equalTo(mainView).offset(-50)
            make.top.equalTo(mainView).offset(10)
           // make.center.equalTo(mainView)

        }
        labelTitle.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.leading.equalTo(viewForCell).offset(15)
        }
    }
    
}

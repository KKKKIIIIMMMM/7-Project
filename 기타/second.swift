//
//  second.swift
//  7 Project
//
//  Created by 김동준 on 8/26/24.
//

import UIKit

class second: UIView {
        
private let top: UILabel = {
    let top = UILabel()
        top.text = "폴더"
        top.textColor = .black
        top.textAlignment = .center
        top.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return top
    }()
        
private let firstimageView = UIImageView(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
        imageView.image = UIImage(named: "first")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
private let secondimageView = UIImageView(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
        imageView.image = UIImage(named: "second")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
        
private let Donebutton: UIButton = {
    let Donebutton = UIButton()
        Donebutton.setTitle("메모", for: .normal)
        Donebutton.setTitleColor(.black, for: .normal)
        Donebutton.translatesAutoresizingMaskIntoConstraints = false
//        Donebutton.addTarget(self, action: #selector(backbutton), for: .touchDown)
        return Donebutton
}()
        
private let delete: UIButton = {
    let delete = UIButton()
        delete.setTitle("최근 삭제된 항목", for: .normal)
        delete.setTitleColor(.black, for: .normal)
        delete.translatesAutoresizingMaskIntoConstraints = false
//        delete.addTarget(self, action: #selector(complete), for: .touchDown)
        return delete
}()
            
private let Write: UIButton = {
    let Write = UIButton()
        Write.setTitle("작성하기", for: .normal)
        Write.setTitleColor(.black, for: .normal)
        Write.translatesAutoresizingMaskIntoConstraints = false
//        Write.addTarget(self, action: #selector(complete), for: .touchDown)
        return Write
}()

override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
}

private func configureUI() {
    view.backgroundColor = .white
    [
        
        top,
        firstimageView,
        secondimageView,
        Donebutton,
        delete,
        Write
        
    ].forEach { view.addSubview($0) }
    
    top.snp.makeConstraints {
        $0.top.equalTo(collectionView.snp.bottom)
        $0.leading.trailing.equalToSuperview().inset(16)
        $0.height.equalTo(300)
        $0.bottom.equalTo(view.safeAreaLayoutGuide)
    }
    firstimageView.snp.makeConstraints {
        $0.top.equalTo(view.safeAreaLayoutGuide)
        $0.leading.equalTo(30)
    }
    Donebutton.snp.makeConstraints {
        $0.top.equalTo(collectionView.snp.bottom)
        $0.leading.trailing.equalToSuperview().inset(16)
        $0.height.equalTo(300)
        $0.bottom.equalTo(view.safeAreaLayoutGuide)
    }
    delete.snp.makeConstraints {
        $0.top.equalTo(collectionView.snp.bottom)
        $0.leading.trailing.equalToSuperview().inset(16)
        $0.height.equalTo(300)
        $0.bottom.equalTo(view.safeAreaLayoutGuide)
    }
    Write.snp.makeConstraints {
        $0.top.equalTo(collectionView.snp.bottom)
        $0.leading.trailing.equalToSuperview().inset(16)
        $0.height.equalTo(300)
        $0.bottom.equalTo(view.safeAreaLayoutGuide)
    }
}



    
    



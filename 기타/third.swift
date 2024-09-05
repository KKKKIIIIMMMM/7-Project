//
//  third.swift
//  7 Project
//
//  Created by 김동준 on 8/26/24.
//

import UIKit

class third: UICollectionViewCell {
    
    private let folder: UIButton = {
        let folder = UIButton(type: .system)
        folder.setTitle("폴더", for: .normal)
        folder.addTarget(self, action: #selector(folderButtonTapped), for: .touchDown)
        folder.translatesAutoresizingMaskIntoConstraints = false
        return folder
    }()
    
    private let edit: UIButton = {
        let edit = UIButton(type: .system)
        edit.setTitle("편집", for: .normal)
        edit.addTarget(self, action: #selector(folderButtonTapped), for: .touchDown)
        edit.translatesAutoresizingMaskIntoConstraints = false
        return edit
    }()
    
    private let write: UIButton = {
        let write = UIButton(type: .system)
        write.setTitle("작성하기", for: .normal)
        write.addTarget(self, action: #selector(folderButtonTapped), for: .touchDown)
        write.translatesAutoresizingMaskIntoConstraints = false
        return write
    }()
    
    private let top: UILabel = {
        let top = UILabel()
        top.text = "최근 삭제된 항목"
        top.textColor = .black
        top.textAlignment = .center
        top.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return top
    }()
    
    private let search: UISearchBar = {
        let search = UISearchBar
        search.placeholder = "검색어 입력"
        search.showsCancelButton = true
        search.barStyle = .default
        search.delete = self
        return search
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(mainviewTableViewCell.self, forCellReuseIdentifier: "thirdTableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    private func configureUI() {
    view.backgroundColor = .white
    [
                folder,
                edit,
                write,
                top,
                search,
                tableView
                
    ].forEach { view.addSubview($0) }
        
        folder.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(300)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        edit.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(30)
        }
        write.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(300)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        top.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(300)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        search.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(300)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(300)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
    
    extension third: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 20
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdTableViewCell", for: indexPath) as! thirdTableViewCell
            return cell
        }
    }

        

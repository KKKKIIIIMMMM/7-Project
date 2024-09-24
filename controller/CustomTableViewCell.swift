//
//  Untitled.swift
//  7 Project
//
//  Created by 김동준 on 9/23/24.
//
import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel!
    var memoLabel: UILabel!
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
    cell.titleLabel.text = memo.title
    cell.memoLabel.text = memo.content
    return cell

}

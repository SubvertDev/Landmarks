//
//  Created by SubvertDev on 21/03/2022.
//

import UIKit
import SnapKit

final class LandmarksView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = K.TableView.separatorInsets
        tableView.register(LandmarkCell.self, forCellReuseIdentifier: K.CellReuseId.landmarkCell)
        return tableView
    }()
    private let headerView = HeaderView(frame: K.Header.frame)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public
    func updateTableView() {
        tableView.reloadData()
    }
    
    // MARK: Private
    private func addSubviews() {
        addSubview(tableView)
        tableView.tableHeaderView = headerView
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        headerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(K.Header.height)
        }
    }
}

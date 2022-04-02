//
//  Landmarks module
//  Created by SubvertDev on 21/03/2022.
//

import UIKit

protocol LandmarksDisplayLogic: AnyObject {
    func updateView(with: [LandmarkModel])
    func showError(message: String)
}

final class LandmarksViewController: UIViewController {
    private let interactor: LandmarksBusinessLogic
    private let router: LandmarksRouterProtocol

    private var myView: LandmarksView { return view as! LandmarksView }
    private var viewModel: [LandmarkModel] = []
    
    // MARK: Init
    init(interactor: LandmarksBusinessLogic,
         router: LandmarksRouterProtocol) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Lifecycle
    override func loadView() {
        view = LandmarksView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.Titles.landmarkTitle
        myView.tableView.delegate = self
        myView.tableView.dataSource = self
        
        interactor.initialState()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    // MARK: Actions
    @objc func favoriteSwitchClicked(_ sender: UISwitch) {
        interactor.fetchLandmarks(areFavorites: sender.isOn)
    }
}

// MARK: - LandmarksDisplayLogic
extension LandmarksViewController: LandmarksDisplayLogic {
    
    func updateView(with landmarks: [LandmarkModel]) {
        viewModel = landmarks
        myView.updateTableView()
    }
    
    func showError(message: String) {
        showAlert(withMessage: message)
    }
}

// MARK: - DataSource & Delegate
extension LandmarksViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellReuseId.landmarkCell, for: indexPath) as! LandmarkCell
        cell.set(with: viewModel[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return K.CellAppearance.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        interactor.cellTapped(withModel: viewModel[indexPath.row])
        router.openDetailedLandmarkVC()
    }
}

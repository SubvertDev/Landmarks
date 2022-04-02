//
//  DetailedLandmark module
//  Created by SubvertDev on 21/03/2022.
//

import UIKit

protocol DetailedLandmarkDisplayLogic: AnyObject {
    func showLandmark(viewModel: LandmarkModel)
    func showError(message: String)
}

final class DetailedLandmarkViewController: UIViewController {
    let interactor: DetailedLandmarkBusinessLogic
    let router: DetailedLandmarkRouterProtocol & DetailedLandmarkDataPassing
    
    var myView: DetailedLandmarkView { return view as! DetailedLandmarkView }
    var myView2: DetailedLandmarkView!
    
    // MARK: Init
    init(interactor: DetailedLandmarkBusinessLogic,
         router: DetailedLandmarkRouterProtocol & DetailedLandmarkDataPassing) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: View lifecycle
    override func loadView() {
        view = DetailedLandmarkView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .never
        interactor.initialState()
    }
}

extension DetailedLandmarkViewController: DetailedLandmarkDisplayLogic {
    
    func showLandmark(viewModel: LandmarkModel) {
        title = viewModel.name
        myView.updateView(with: viewModel)
    }
    
    func showError(message: String) {
        showAlert(withMessage: message) {
            self.router.closeDetailedLandmarkVC()
        }
    }
}

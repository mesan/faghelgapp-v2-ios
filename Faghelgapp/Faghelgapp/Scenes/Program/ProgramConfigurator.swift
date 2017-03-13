import Foundation

class ProgramConfigurator {
    
    static let sharedInstance = ProgramConfigurator()
    
    private init() {
        // Enforce Singleton Pattern
    }
    
    func configure(viewController: ProgramViewController) {
        let presenter = ProgramPresenter()
        presenter.viewController = viewController
        
        let programService = ProgramService()
        let interactor = ProgramInteractor(programService: programService)
        interactor.presenter = presenter
        
        let router = ProgramRouter()
        viewController.router = router
        router.viewController = viewController
        
        viewController.interactor = interactor
    }
}

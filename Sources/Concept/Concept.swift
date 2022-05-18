import Foundation
import UIKit

@objc public class Concept : NSObject {
    private let viewController: UIViewController
    private let configuration: Configuration
    let evenView: UIView
    let oddView: UIView

    @objc public init(with controller: UIViewController, configuration config: Configuration) {
        print( #function )
        viewController = controller
        configuration = config
        evenView = UIView(frame: .zero)
        oddView = UIView(frame: .zero)
        super.init()
        prepareView()
    }

    private func prepareView() {
        print( #function )
        viewController.view.backgroundColor = .black

        viewController.view.addSubview(evenView)
        viewController.view.addSubview(oddView)

        evenView.backgroundColor = configuration.evenColor
        oddView.backgroundColor = configuration.oddColor
    }

    @objc public func didLayout() {
        print( #function )
        let cubit = min(viewController.view.bounds.width,viewController.view.bounds.height) / 4
        let midHeight = viewController.view.bounds.origin.y + (viewController.view.bounds.height / 2)
        let midWidth = viewController.view.bounds.origin.x + (viewController.view.bounds.width / 2)

        let evenBox = CGRect(x: midWidth - (cubit), y: midHeight - (cubit/2), width: cubit, height: cubit)
        let oddBox = CGRect(x: midWidth + (cubit), y: midHeight - (cubit/2), width: cubit, height: cubit)

        evenView.frame = evenBox
        oddView.frame = oddBox
    }

    @objc public func willAppear() {
        print( #function )
    }

    @objc public func didDisappear() {
        print( #function )
    }

}

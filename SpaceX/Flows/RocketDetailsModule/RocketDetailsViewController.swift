//
//  RocketDetailsViewController.swift
//  SpaceX
//
//  Created by Jaafar Barek on 26/03/2021.
//

import UIKit
import Kingfisher
import SafariServices
import RxSwift

class RocketDetailsViewController: UIViewController, Presentable {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var rocketImageView: UIImageView!
    
    var viewModel: RocketDetailsViewModel!
    
    var onContinueTap: ((String) -> Void)?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(viewModel != nil, "ViewModel cannot be nil")
        
        configureViews()
        fetchOptions()
    }
}

// MARK: IB-Actions
private extension RocketDetailsViewController {
    @IBAction func onWikipediaButtonTapped(_ sender: UIButton) {
        if let url = viewModel.wikepediaUrl {
            _ = showSafariVC(url: url)
        }
    }
}

// MARK: Private Helper Methods
private extension RocketDetailsViewController {
    func configureViews() {
        title = viewModel.tripName
        titleLabel.applyStyle(textColor: .white, font: Fonts.font(name: .font700, size: 22))
        descriptionLabel.applyStyle(textColor: .blueGray, font: Fonts.font(name: .font500, size: 15))
    }
    
    func fetchOptions() {
        showHUD()
        
        viewModel.downloadTrigger.onNext(())
        
        viewModel.rocketSubject
            .bind(onNext: { _ in
                self.hideHUD()
                self.updateUI()
                
            })
            .disposed(by: disposeBag)
    }
    
    func updateUI() {
        titleLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        
        if let url = viewModel.imageUrl {
            rocketImageView.kf.setImage(with: url)
        }
    }
    
    func showSafariVC(url: URL, completion: (() -> Void)? = nil) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: completion)
        return safariVC
    }
}

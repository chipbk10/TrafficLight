//
//  CarViewController+Events.swift
//  TrafficLight
//
//  Created by Hieu Luong on 26/06/2023.
//

import UIKit

extension CarViewController: UITextViewDelegate {
    
    // MARK: - Events
    
    func textViewDidChange(_ textView: UITextView) {
        updateWarningLabelView()
    }
    
    @objc func didTapButton() {
        guard viewModel.isValid(carModel: textView.text) else { return }
        completion(textView.text)
    }
    
    // MARK: - Helper
    
    private func updateWarningLabelView() {
        warningLabelView.text = viewModel.isValid(carModel: textView.text) ? "" : viewModel.invalidCarModelMessage
    }
}

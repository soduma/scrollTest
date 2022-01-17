//
//  ViewController.swift
//  scrollTest
//
//  Created by 장기화 on 2022/01/17.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let image1 = UIView()
    let image2 = UIView()
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        scrollView.backgroundColor = .brown
        contentView.backgroundColor = .red
        
        image1.backgroundColor = .yellow
        image2.backgroundColor = .green

        stackView.axis = .vertical // 세로스크롤
//        stackView.axis = .horizontal // 가로스크롤
        stackView.distribution = .equalSpacing
        
        [image1, image2].forEach {
            stackView.addArrangedSubview($0)
            $0.snp.makeConstraints {
                $0.height.equalTo(500) // 세로스크롤
//                $0.width.equalTo(500) // 가로스크롤
            }
        }

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }

        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview() // 세로스크롤
//            $0.height.equalToSuperview() // 가로스크롤
        }

        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
    }
}


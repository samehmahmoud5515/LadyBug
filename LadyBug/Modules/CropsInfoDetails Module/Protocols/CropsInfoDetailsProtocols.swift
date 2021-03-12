//
//  CropsInfoProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/6/21.
//

import Foundation

protocol CropsInfoDetailsPresenterProtocol {
      var localizer: CropsInfoDetailsLocalizer { get }
      var images: CropsInfoDetailsImages { get }
      func attach()
  }
  protocol CropsInfoDetailsViewProtocol: class {
      
  }

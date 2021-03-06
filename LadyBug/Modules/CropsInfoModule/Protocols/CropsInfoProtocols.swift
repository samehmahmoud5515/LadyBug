//
//  CropsInfoProtocols.swift
//  LadyBug
//
//  Created by Mohamed Abdelhamed Ahmed on 3/6/21.
//

import Foundation

protocol CropsInfoPresenterProtocol {
      var localizer: CropsInfoLocalizer { get }
      var images: CropsInfoImages { get }
      func attach()
  }
  protocol CropsInfoViewProtocol: class {
      
  }

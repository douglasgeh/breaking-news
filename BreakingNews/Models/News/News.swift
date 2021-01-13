//
//  News.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

struct News : Codable {
    let id_documento: String?
    let chapeu: String?
    let titulo: String?
    let linha_fina: String?
    let data_hora_publicacao: String?
    let url: String?
    let imagem: String?
    let imagem_credito: String?
    let source: String?
}

//
//  NewsDetail.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

struct NewsDetail: Codable {
    let url: String?
    let source: String?
    let produto: String?
    let editoria: String?
    let subeditoria: String?
    let titulo: String?
    let credito: String?
    let datapub: String?
    let horapub: String?
    let linhafina: String?
    let imagem: String?
    let thumbnail: String?
    let creditoImagem: String?
    let legendaImagem: String?
    let origem: String?
    let id: String?
    let corpoformatado: String?
}

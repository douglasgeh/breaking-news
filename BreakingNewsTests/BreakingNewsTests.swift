//
//  BreakingNewsTests.swift
//  BreakingNewsTests
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import XCTest
@testable import BreakingNews

class BreakingNewsTests: XCTestCase {

    
    var news: News!
    var newsDetail: NewsDetail!
    var authCredentials: AuthCredentials!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.news = News(id_documento: "1", chapeu: "Politica", titulo: "Titulo", linha_fina: "Linha fina", data_hora_publicacao: "Data e hora", url: "URL", imagem: "Image", imagem_credito: "Image credit", source: "Source")

        self.newsDetail = NewsDetail(url: "url", source: "source", produto: "produto", editoria: "editoria", subeditoria: "subeditoria", titulo: "titulo", credito: "credito", datapub: "datapub", horapub: "horapub", linhafina: "linhafina", imagem: "imagem", thumbnail: "thumbnail", creditoImagem: "creditoimg", legendaImagem: "legendaimg", origem: "origem", id: "id", corpoformatado: "corpoformatado")
        
        self.authCredentials = AuthCredentials(user: "User", pass: "Pass")
        
        KeychainManager.shared.update(value: "tokTest", forKey: "tokTest")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.news = nil
        self.newsDetail = nil
        self.authCredentials = nil
    }
    
    func testCredentials() {
        XCTAssertNotNil(self.authCredentials.toHttpBodyAdapter(), "Http body adapter must not be nil")
    }
    
    func testNewsDetail() {
        XCTAssertNotNil(newsDetail.corpoformatado, "News body must not be nil")
    }

    func testNews() {
        XCTAssertNotNil(news.id_documento, "Document id must not be nil")
    }
    
    func testKeyChainAccess() {
        XCTAssertNotNil(KeychainManager.shared.getValue(forKey: "tokTest"), "Tok must no be nil")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

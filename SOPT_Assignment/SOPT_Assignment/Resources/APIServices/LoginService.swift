//
//  LoginService.swift
//  SOPT_Assignment
//
//  Created by hjyoo on 2020/05/16.
//  Copyright © 2020 hjyoo. All rights reserved.
//

import Foundation
import Alamofire

struct LoginService {
    //싱글톤 객체로 앱 어디서든 접근 가능
    static let shared = LoginService()
    
    //request body에 들어갈 parameter 생성
    private func makeParameter(_ id: String, _ pwd: String) -> Parameters {
        //key값을 꼭 맞춰주자
        return ["id": id, "password": pwd]
    }
    
    func login(id: String, pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        //request header 생성
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        //원하는 형식의 http request 생성
        let dataRequest = Alamofire.request(APIConstants.signinURL, method: .post, parameters: makeParameter(id, pwd), encoding:
            JSONEncoding.default, headers: header)
        
        //데이터 통신을 이때 시작
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            //네트워크 연결이 되어있는지 확인하는 구문
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.result.value else { return }
                let networkResult = self.judge(by: statusCode, value)
                completion(networkResult)
            case .failure: completion(.networkFail)
            }
        }
    }
    //statusCode에 따라 분기 실행
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isUser(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    //최종적으로 데이터 통신에 성공한 경우, JSON 타입 decordeing을 실행 후, 값을 확인한다.
    private func isUser(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SigininData.self, from: data) else { return .pathErr }
        guard let tokenData = decodedData.data else { return .requestErr(decodedData.message) }
        return .success(tokenData.jwt)
    }
    
}

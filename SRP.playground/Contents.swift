import UIKit


// Single Responsibilty Principle
/*
 It states that every module should have single responsibility and reson to change
 IT keeps  you class and  code clean and independent as possible
 */

// without SRP

class handler {
    // hidden dependecy // class will not be knowing the depnedecy bcs class might work for all network calls and parsing the json data and saving dB in same file so this not good and doesnot satisfy the SRP
    func handlers() {
        let data =  requestDataAPI()
        let parsedata = parsingJsonData(data : data)
        SaveDataToDB(array : parsedata)
    }
    
    private func requestDataAPI()-> Data{
        
        return Data()
    }
    
    private func parsingJsonData(data: Data)->[String] {
        return []
    }
    
    private func SaveDataToDB(array:[String]){
       
    }
}


// with SRP

/* here we have three diffrent classes for doing network calls and dataparsing and saving to DB which satisfy the SRP bcs each class have only one REsponsibility ;like api calls will done in one class and that class has resposibility to work on only one api calls that is a single reason for a class
 */

class differnthandler {
    let networkdatahandler : NetWorkhandler
    let parsedJsondatahandler :ParseJsonDataHandler
    let dataHandler : DataHandler
    
    init(networkdatahandler: NetWorkhandler, parsedJsondatahandler: ParseJsonDataHandler, dataHandler: DataHandler) {
        self.networkdatahandler = networkdatahandler
        self.parsedJsondatahandler = parsedJsondatahandler
        self.dataHandler = dataHandler
    }
    
    func handlers() {
        let data =  networkdatahandler.requestAPIToGetJsonDat()
        let parsedata = parsedJsondatahandler.parseJsonDataTomodel(data: data)
        dataHandler.saveDataToDB()
    }
    
}

class NetWorkhandler {
    
    func requestAPIToGetJsonDat() -> Data{
        return Data()
    }
}

class ParseJsonDataHandler {
    func parseJsonDataTomodel(data : Data) -> [String] {
        return []
    }
}

class DataHandler {
    func saveDataToDB() {
        
    }
}

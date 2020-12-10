/*
 客製 Charts 按照固定時間間隔區分。 如: 8:30 - 9:00 - 9:30 
 因為筆者時區在 TWN +8G ，所以在 class MyStringFormatter 類
 Formatter 設定必須多做一層 currectDateFormatter 確保取到的
 "HH:mm" 為正確的時間，後續轉乘1970/01/01/HH/mm 再用 +0G時區
 轉 TimeInterval。 
*/

 let xAxis = stockChartBackgroundView.chartView.xAxis
        
        // 生成所需StringFormatter
        let formatter = MyStringFormatter()
        // 指定自定義 xAxis.valueFormatter 的 Formatter
        let chartXAxisFormatter = ChartXAxisFormatter(dateFormatter: formatter.finalDateFormatter)
      
        // 避免值重複
        xAxis.granularityEnabled = true
        // 必要: 此屬性為true時x軸Label 會強制內縮可避免Label 被剪裁。
        // 但是因為標籤都已經計算好，所以x軸反而錯位，建議設定 false
        xAxis.avoidFirstLastClippingEnabled = false
        
        
        var enties: [CandleChartDataEntry] = []
        for data in datas {
            let time = formatter.converToDaily(timeInterval: data.x)
            let chartData = CandleChartDataEntry(x: time, shadowH: data.shadowH, shadowL: data.shadowL, open: data.open, close: data.close)
            enties.append(chartData)
        }
        let dataSet = CandleChartDataSet(entries: enties, label: nil)
        let chartDatas = CandleChartData(dataSet: dataSet)
        stockChartBackgroundView.chartView.data = chartDatas
        // 必要
        xAxis.valueFormatter = chartXAxisFormatter

        // 必要，設定x軸上下限
        xAxis.axisMinimum = formatter.makeDefaultTimeInterval(dateString: "08:30")
        xAxis.axisMaximum = formatter.makeDefaultTimeInterval(dateString: "13:30")
        
        // 每小時間隔:n + 1
        // 每半小時間隔: 2n + 1
        // force: 為true x軸數據會平均分配
        xAxis.setLabelCount( (13 - 8) + 1, force: true)
       
        //設定最大可顯示(數據)範圍．範例設定的為TimeInterval (秒)為單位，所以務必要設定好範圍
        // 1hr = 1800s
        chartView.setVisibleXRangeMaximum(3600)

        
    }
    
}




class ChartXAxisFormatter: NSObject {
    fileprivate var dateFormatter: DateFormatter?
    
    convenience init(dateFormatter: DateFormatter) {
        self.init()
        self.dateFormatter = dateFormatter
    }
}

// 遵循Charts IAxisValueFormatter 協議，指定為 xAxis.valueFormatter 。
// xAxis 取值時會依照此協議進行
extension ChartXAxisFormatter: IAxisValueFormatter {
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        guard let dateFormatter = dateFormatter else { return "" }
        let date = Date(timeIntervalSince1970: value )
        return dateFormatter.string(from: date)
    }
    
}



class MyStringFormatter {
    // 指定年份
    private let initDate: String = "1970/01/01/"
    
    
    /// 將時間 HH:mm 轉型成特定年份TimeInterval 用
    let defaultDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd/HH:mm"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    
    /// 依照系統時區將TimeInterval 轉型成時間格式 "HH:mm"
    let currectDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    /// 將 TimeInterval轉型成所需的時間 "HH:mm"
    let finalDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    
    
    /// 將輸入的時間"HH:mm" 轉成 指定年份TimeInterval
    /// - Parameter dateString: 時間 "HH:mm"
    /// - Returns: timeIntervalSince1970
    func makeDefaultTimeInterval(dateString: String)-> TimeInterval{
        var newStr = initDate
        newStr.append(dateString)
        guard let date = defaultDateFormatter.date(from: newStr) else { return 0}
        return date.timeIntervalSince1970
    }
    
    
    
    /// 將 TimeInterval 轉成指定年份時間的TimeInterval (移植HH:mm)
    /// - Parameter timeInterval: 正確日期 TimeInterval
    /// - Returns: 輸出 timeIntervalSince1970
    func converToDaily(timeInterval: TimeInterval) -> TimeInterval {
        let date = Date(timeIntervalSince1970: timeInterval)
        let str = currectDateFormatter.string(from: date)
        var newStr = initDate
        newStr.append(str)
        guard let newDate = defaultDateFormatter.date(from: newStr) else{
            return timeInterval}
        return newDate.timeIntervalSince1970
    }
    




// MARK: 簡易飯例
//use 範例
class YourAxisValueFormatter: IAxisValueFormatter{

    func stringForValue(_ value: Double, axis: AxisBase?) -> String {

        if value >= 100 && value < 1000 {
            return "Hundred"
        } else {
            return String(value)
        }  
    }
}



class viewController: ViewController {
    
    lazy var chartView: LineChartView = LineChartView()
    override func viewDidLoad(){
        super.viewDidLoad()

        let xAxis = chartView.xAxis
        xAxis.valueFormatter = YourAxisValueFormatter()

    }
}
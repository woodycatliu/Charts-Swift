import Charts

/// 待補
class ChartsAttribute {
    
    
    func initAttribute() {
        
        // 合併圖: 可同時包含所有類型線圖的表格(折線、K線、柱狀等)
        let combinedChartView = CombinedChartView()
        // 折線圖
        _ = LineChartView()
        // 柱狀圖
        _ = BarChartView()
        // 水平柱狀圖
        _ = HorizontalBarChartView()
        
        /*基本屬性*/
        
        // 數據繪製順序，陣列越靠前繪製順序遠晚，範例：柱狀數據將在線數據之後繪製
        combinedChartView.drawOrder = [DrawOrder.bar.rawValue, DrawOrder.line.rawValue]
        // 無數據時顯示文字
        combinedChartView.noDataText = "暫無資料"
        
        // 觸控放大: 關閉
        combinedChartView.pinchZoomEnabled = false
        // 雙擊放大: 關閉
        combinedChartView.doubleTapToZoomEnabled = false
        // X軸縮放: 關閉
        combinedChartView.scaleXEnabled = false
        // Y軸縮放：關閉
        combinedChartView.scaleYEnabled = false
        
        // 關閉圖表拖曳
        combinedChartView.dragEnabled = false
        // 關閉X軸拖曳
        combinedChartView.dragXEnabled = false
        // 關閉Y軸拖曳
        combinedChartView.dragYEnabled = false
        // 拖曳滾動慣性運動定律: 關閉
        combinedChartView.dragDecelerationEnabled = false
        // 拖曳滾動慣性摩擦係數: 0
        combinedChartView.dragDecelerationFrictionCoef = 0
        
        
        // 拖曳高亮: 關閉
        // 拖曳時自動在最靠近的觸控點顯示十字線
        combinedChartView.highlightPerDragEnabled = false
        // 點擊高亮: 關閉
        combinedChartView.highlightPerTapEnabled = false
        
        
        /* combinedChartView.legend: 取得圖表圖例*/
        // 圖例隱藏
        combinedChartView.legend.enabled = false
        
        // 設定圖表X軸數據可視最大範圍 (依照輸入X軸的單位)
        combinedChartView.setVisibleXRangeMaximum(5)
        
    }
    
    
    
    func initXAxis(chartView: ChartViewBase) {
        // 圖表X軸
        let xAxis = chartView.xAxis
        
        // x軸標籤字型
        xAxis.labelFont = .systemFont(ofSize: 10)
        // 顏色
        xAxis.labelTextColor = .black
        
        // x軸位子: 圖表上方
        xAxis.labelPosition = .top
        // x軸標籤選轉角度: 選轉90度。
        // 單位(度)，無需計算pi
        xAxis.labelRotationAngle = 90
      
        // x軸與圖表間的邊線寬度: 間距 1
        xAxis.axisLineWidth = 1
        // x軸與圖表間的顏色: 黑色
        xAxis.axisLineColor = .black
        
        // X軸顯示數據(不設定自動計算)，會影響圖表顯示範圍
        xAxis.axisMinimum = 0
        xAxis.axisMaximum = 500
        
        // 顯示x軸標籤: 是
        xAxis.drawLabelsEnabled = true
    }
    
    
    func initYAxis(chartView: CombinedChartView) {
        // 左邊Y軸
        let yAxisLeft = chartView.leftAxis
        // 右邊Y軸
        _ = chartView.rightAxis
        
        // Y軸顯示: 在圖表內
        yAxisLeft.labelPosition = .insideChart
        // 字型
        yAxisLeft.labelFont = .systemFont(ofSize: 10)
        // 字顏色
        yAxisLeft.labelTextColor = .black
        
        
        // 橫向網格繪製: 關閉(左右Y軸都要關閉才有效）
        yAxisLeft.drawGridLinesEnabled = false
        // 網格線寬: 左右都要設定
        yAxisLeft.gridLineWidth = 1
        // 網格顏色: 左右都要設定
        yAxisLeft.gridColor = .black
        // 軸線顯示: 是
        yAxisLeft.drawAxisLineEnabled = true
        
        // Y軸顯示數據(不設定自動計算)，會影響圖表顯示範圍
        yAxisLeft.axisMinimum = 0
        yAxisLeft.axisMaximum = 500
        
    }



    // MARK: （Legend）圖例是圖表的側面部分，給出了每個系列的簡短文字說明。您可以在此圖例中指定與每個系列關聯的文本
    // Lsgend 圖示：顯示線圖的顏色圖示
    func showLegend() {

        let legend = chartView.legend
        // 預設 false
        legend.enabled = true
        // legend 水平位子
        legend.horizontalAlignment = .left
        // legend 垂直位子
        legend.verticalAlignment = .bottom
        // legend 圖示位子 (水平 label 左邊, 垂直 label 上面)
        legend.orientation = .horizontal
        // legend 繪製區塊 (inside: 繪製在圖表裡)
        legend.drawInside = true
        // legend 圖示形狀
        legend.form = .line
        // legend 圖示尺寸
        legend.formSize = 9
        // legend label 文字
        legend.font = .systemFont(ofSize: 20)
        // legend label 文字顏色
        legend.textColor = .blue
        // legend 圖示之間的間隔，需搭配 dataSet.colors 設定
        // dataSet.colors = [color1, color2, color3]
        legend.xEntrySpace = 4
    }

     // MARK: ChartDataEntry 提供圖表數據，以陣列方式提供給 ChartDataSet
    func setDataEntry() {
        // BaseDataEntry
        _ = ChartDataEntry()
        // 柱狀圖DataEntty
        _ = BarChartDataEntry()
        // 氣泡圖DataEntry
        _ = BubbleChartDataEntry()
        // 蠟燭DataEntry
        _ = CandleChartDataEntry()
        // 派圖DataEntry
        _ = PieChartDataEntry()
        // 雷達圖
        _ = RadarChartDataEntry()
        
        // x 軸數據 y軸數據
        // icon: 小圖示(可顯示在數據上面
        let dataEntry = ChartDataEntry(x: 0, y: 0, icon: UIImage(), data: Data())
        
        // 表示圖表的各條目的設定。
        // 提供圖表實際數據 [dataEntry]
        _ = ChartDataSet()
        // 柱狀圖
        _ = BarChartDataSet()
        // 派圖
        _ = PieChartDataSet()
        // 線圖
        _ = LineChartDataSet()
        // 雷達圖
        _ = RadarChartDataSet()
        // 氣泡圖
        _ = BubbleChartDataSet()
        // 蠟燭圖
        _ = CandleChartDataSet()
        // 散狀圖
        _ = ScatterChartDataSet()
        // label: legend 標籤文字
        let dataSet = ChartDataSet(entries: [dataEntry], label: "1234")
        
        // 是否繪製 icon
        dataSet.drawIconsEnabled = true
        // 是否在圖表上顯示Y值
        dataSet.drawValuesEnabled = true
        // 圖表要依賴哪一側Y值（如果你有兩側Y值且數據不同）
        dataSet.axisDependency = .left
        // 設定圖表顏色(單色)
        dataSet.setColor(UIColor)
        // 設定圖表顏色（多色）
        dataSet.setColors([UIColor])


        // 蠟燭(K線)獨有，設定開盤收盤顏色
        // 開盤 = 收盤
        candleDataSet.neutralColor = UIColor()
    
        // 開盤 > 收盤
        candleDataSet.increasingColor
    
        // 開盤 < 收盤
        candleDataSet.odecreasingColor
        // 是否填滿顏色-開盤 > 收盤
        candleDataSet.increasingFilled
        // 是否填滿顏色-開盤 < 收盤
        candleDataSet.creasingFilled

        
    



        // 部分圖有: Line圖 
        // 是否填充折線圖線下顏色
        // (Charts Fill 協議)
        lineDataSet.fill = Fill() 
        // 透明度
        lineDataSet.fillAlpha = 1
        // 設定線圖Y值圓點顏色
        lineDataSet.setCircleColor(.black)
        // 設定線圖Y值圓點半徑
        lineDataSet.circleRadius = 3
        // 是否繪製圓點
        lineDataSet.drawCircleHoleEnabled = false
        // 圖例style線的長度
        lineDataSet.formLineDashLengths = [2, 2.5]
        //圖例style線的寬度
        lineDataSet.formLineWidth = 1
        //圖例style線 尺寸
        lineDataSet.formSize = 5


        

        // 檢查是否繪製icon
        _ = dataSet.isDrawIconsEnabled
        // 檢查是否繪製Y值
        _ = dataSet.isDrawValuesEnabled
        // 檢查是否開啟高亮
        _ = dataSet.isHighlightEnabled
        
        
        // 封裝 ChartData ，必須依照相對屬性配置
        _ = ChartData()
        // 折線圖
        _ = LineChartData()
        // 柱狀圖
        _ = BarChartData()
        // 氣泡圖
        _ = BubbleChartData()
        // 蠟燭圖
        _ = CandleChartData()
        // 派圖
        _ = PieChartData()
        // 雷達圖
        _ = RadarChartData()
        // 散落圖
        _ = ScatterChartData()
        
        let chartData = ChartData(dataSet: dataSet)
        _ = ChartData(dataSets: [dataSet])
        
        // use
        chartView.data = chartData
        
    }
    
}

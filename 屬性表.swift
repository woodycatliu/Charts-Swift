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
    
    
}

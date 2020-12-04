
extension YourViewController: ChartViewDelegate {

    /// 此API 會呼出當下被選擇的ChartsView當下被選擇的點
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        showMarkerView(values: reviseValue(value: entry.y))
        
    }
}

extension YourViewController {

/// 抓取ChartView最接近中心點的 X軸 點並且選取它
 func findChartsCurrectCenter(chartView: ChartViewBase){
    let x = Double(chartView.bounds.width / 2)
    let point = CGPoint(x: x, y: 0)
    let h = chartView.getHighlightByTouchPoint(point)
    chartView.highlightValue(h, callDelegate: true)
}

 /// 顯示MarkerView #values: 要顯示的String
 func showMarkerView(values: String){
    
    // BalloonMarker 要自己實作子類別
    let marker = BalloonMarker(color: .systemGray3, font: .systemFont(ofSize: 10), textColor: .systemBlue, insets: .zero)
    marker.chartView = stockChartBackgroundView.chartView
    marker.minimumSize = CGSize(width: 80, height: 40)
    marker.setLabel(values)
    marker.chartView?.marker = marker
        
    }
    
}
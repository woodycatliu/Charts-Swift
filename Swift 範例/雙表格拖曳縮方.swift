
/*
透過ChartViewDelegate 可以達到效果
chartView.viewPortHandler.touchMatrix

viewPortHandler: Charts操作代理
touchMatrix: ChartView 當下動畫 CGAffineTransform

透過同時更換你的ChartViews 的動畫，達成所有ChartView同步
*/
extension YourViewController: ChartViewDelegate {

/// 連動縮放
func chartScaled(chartView: ChartViewBase, scaleX: CGFloat, scaleY: CGFloat){
        let scrMatrix: CGAffineTransform = chartView.viewPortHandler.touchMatrix
        
        yourFirstChartView.viewPortHandler.refresh(newMatrix: scrMatrix, chart: yourFirstChartView, invalidate: true)
        yourSecondChartView.viewPortHandler.refresh(newMatrix: scrMatrix, chart: yourSecondChartView, invalidate: true)

    }
}

/// 連動拖曳
func chartTranslated(_ chartView: ChartViewBase, dX: CGFloat, dY: CGFloat) {
        
    let scrMatrix: CGAffineTransform = chartView.viewPortHandler.touchMatrix
    chartView.viewPortHandler.refresh(newMatrix: scrMatrix, chart: chartView, invalidate: true)
    chartView.viewPortHandler.refresh(newMatrix: scrMatrix, chart: chartView, invalidate: true)

}

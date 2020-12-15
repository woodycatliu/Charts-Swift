/*
客製 YAxis/ XAxis 軸的字體顏色。
比如: 每個標籤顏色不同。
方法: 自定義 Axis Renderer 子類別（例如繼承: YAxisRenderer)
override drawYLabels()
X 軸相同
*/

class MyYAxis : YAxisRenderer {
    override func drawYLabels(context: CGContext, fixedPosition: CGFloat, positions: [CGPoint], offset: CGFloat, textAlign: NSTextAlignment)
    {
        guard let yAxis = self.axis as? YAxis else { return }
        let labelFont = yAxis.labelFont

        let from = yAxis.isDrawBottomYLabelEntryEnabled ? 0 : 1
        let to = yAxis.isDrawTopYLabelEntryEnabled ? yAxis.entryCount : (yAxis.entryCount - 1)
        
        let xOffset = yAxis.labelXOffset
        
        for i in from..<to
        {
            let text = axis.getFormattedLabel(i)
            
            // 加上一個回圈。NSAttributedString 顏色改上自定義的 color 解決
            let color: UIColor
            if let value = Double(text) {
                if value > 0 &&  value <= 30 {
                    color = .blue
                }else if  value > 30 &&  value <= 60 {
                    color = .yellow
                }else if value > 60 &&  value <= 90 {
                    color = .brown
                }else {
                    color = .black
                }
            }else { color = .green }
            ChartUtils.drawText(context: context, text: text, point: CGPoint(x: fixedPosition + xOffset, y: positions[i].y + offset), align: textAlign, attributes: [.font: labelFont, .foregroundColor: color])
        }
    }
    
    
}



//USE
chartView.leftYAxisRenderer = MyYAxis(viewPortHandler: chartView.viewPortHandler, axis: leftAxis, transformer: chartView.getTransformer(forAxis: leftAxis.axisDependency))




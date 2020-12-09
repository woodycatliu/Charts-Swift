
// 改寫X軸Label 傳入String的方法。
public protocol IAxisValueFormatter: class
{
    func stringForValue(_ value: Double, axis: AxisBase?) -> String   
}

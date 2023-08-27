//
//  ViewController.swift
//  Counter
//
//  Created by Кирилл on 24.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // аутлет левой кнопки
    @IBOutlet weak private var leftDecriaseecreaseButton: UIButton!
    // аутлет правой кнопки
    @IBOutlet weak private var rightIncreaseButton: UIButton!
    // аутлет лейбла с текстом счётчика
    @IBOutlet weak private var textCounterLabel: UILabel!
    // аутлет кнопки сброса
    @IBOutlet weak private var resetButton: UIButton!
    // аутлет текстового поля истории изменений
    @IBOutlet weak private var historyTextView: UITextView!
    
    // переменная для счётчика нажатий
    private var countOfTaps: UInt = 0
        
    // константа для первой части лейбла счётчика
    private let textLabel: String = "Значение счётчика:\n\n"
    
    // функция для создания текста лейбла посредством конкатенации
    private func makeTextOfLabel() {
        textCounterLabel.text = textLabel + String(countOfTaps)
    }
    
    // перечисление изменений состояния счётчика
    private enum CounterStatuses: String {
        case decrease = ": значение изменено на -1\n"
        case increase = ": значение изменено на +1\n"
        case reset = ": значение сброшено\n"
        case valueBelowZero = ": попытка уменьшить значение счётчика ниже 0\n"
    }
    
    // вычисляем дату и время в типе строки
    private var dateAndTimeStamp: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            return dateFormatter.string(from: Date())
    }
    // функция скролла текстового вью истории статусов
    private func scrollHistoryTextViewToBottom() {
        if historyTextView.text.count > 0 {
            let location = historyTextView.text.count - 1
            let bottom = NSMakeRange(location, 1)
            historyTextView.scrollRangeToVisible(bottom)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // при загрузке счетчик лейбла устанавливается на 0
        makeTextOfLabel()
        // устанавливаем заголовок текстового поля изменения состояний счётчика
        historyTextView.text = "История изменений:\n"
    }
    
    // функция нажатия кнопки сброса
    @IBAction private func resetButtonDidTap(_ sender: Any) {
        countOfTaps = 0
        makeTextOfLabel()
        historyTextView.text += dateAndTimeStamp + CounterStatuses.reset.rawValue
        scrollHistoryTextViewToBottom()
    }
    
    // функция нажатия левой кнопки уменьшения
    @IBAction private func leftDecreaseButtonDidTap(_ sender: Any) {
        if countOfTaps > 0 {
            countOfTaps -= 1
            makeTextOfLabel()
            historyTextView.text += dateAndTimeStamp + CounterStatuses.decrease.rawValue
            scrollHistoryTextViewToBottom()
        } else {
            countOfTaps = 0
            makeTextOfLabel()
            historyTextView.text += dateAndTimeStamp + CounterStatuses.valueBelowZero.rawValue
            scrollHistoryTextViewToBottom()
        }
    }
    
    // функция нажатия правой кнопки увеличения
    @IBAction private func rightIncreaseButtonDidTap(_ sender: Any) {
        countOfTaps += 1
        makeTextOfLabel()
        historyTextView.text += dateAndTimeStamp + CounterStatuses.increase.rawValue
        scrollHistoryTextViewToBottom()
    }
}


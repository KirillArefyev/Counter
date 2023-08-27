//
//  ViewController.swift
//  Counter
//
//  Created by Кирилл on 24.08.2023.
//

import UIKit

class ViewController: UIViewController {
   
    // аутлет кнопки
    @IBOutlet weak private var countOfTapsButton: UIButton!
    // аутлет лейбла с текстом счетчика
    @IBOutlet weak private var textCounterLabel: UILabel!
    
    /* объявление переменной для счетчика нажатий.
     Беззнаковый целочисленный тип UInt выбрал намеренно, исходя из условий ТЗ:
     значение счетчика не может быть отрицательным,
     а значение UInt.max > значения Int.max */
    private var countOfTaps: UInt = 0
    
    /* объявление константы для первой части лейбла
     чтобы визуально отделить счетчик от основного текста,
     добавил два переноса на новую строку - текст и цифры отдельно
     воспринимаются лучше. К тому же снижен риск того, что счетчик может уйти
     за края лейбла при значении близкому к максимальному */
    private let textLabel: String = "Значение счётчика:\n\n"
    
    // функция для создания текста лейбла посредством конкатенации
    private func makeTextOfLabel() {
        textCounterLabel.text = textLabel + String(countOfTaps)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* при загрузке вызов функции создания текста в лейбле
         устанавливает в счетчик 0 */
        makeTextOfLabel()
    }

    @IBAction private func buttonDidTap(_ sender: Any) {
        // отображение тапа в консоли
        print("Нажатие")
        // обновления кол-ва тапов в счетчике
        countOfTaps += 1
        // отображение кол-ва тапов в консоли
        print(countOfTaps)
        /* вызов функции обновления текста в лейбле после обновления
         значения в счетчике тапов */
        makeTextOfLabel()
    }
    
}


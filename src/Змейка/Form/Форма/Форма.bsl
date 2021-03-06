// Алексей "AlexNecro" Курдюков, necroalone@gmail.com, 06.06.2021
&НаКлиенте
Перем Змейка, Монетки;  // Массив
&НаКлиенте
Перем Х, У, ШиринаПоля, ВысотаИнформационнойСтроки, ВысотаПоля; // Число
&НаКлиенте
Перем НаправлениеДвижения;
&НаКлиенте
Перем БылоСтолкновение, ВзялМонетку;
&НаКлиенте
Перем Очки;
&НаКлиенте
Перем ДлинаЗмейкиДляПобеды;
&НаКлиенте
Перем ВИгре;
&НаКлиенте
Перем гпсч;

&НаКлиенте
Процедура Вверх(Команда)
	Если не НаправлениеДвижения = "Вниз" Тогда
		НаправлениеДвижения = "Вверх";
		Если не ВключенТаймер Тогда
			Тик()
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура Вниз(Команда)
	Если не НаправлениеДвижения = "Вверх" Тогда
		НаправлениеДвижения = "Вниз";
		Если не ВключенТаймер Тогда
			Тик()
		КонецЕсли;
	КонецЕсли;	
КонецПроцедуры

&НаКлиенте
Процедура Влево(Команда)
	Если не НаправлениеДвижения = "Вправо" Тогда
		НаправлениеДвижения = "Влево";
		Если не ВключенТаймер Тогда
			Тик()
		КонецЕсли;
	КонецЕсли;	
КонецПроцедуры

&НаКлиенте
Процедура Вправо(Команда)
	Если не НаправлениеДвижения = "Влево" Тогда
		НаправлениеДвижения = "Вправо";
		Если не ВключенТаймер Тогда
			Тик()
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура Обновить()
	
	Если ВИгре <> Истина Тогда
		Возврат;
	КонецЕсли;
	
	Х = Змейка[0].Х;
	У = Змейка[0].У;
	
	Если НаправлениеДвижения = "Вверх" Тогда
		У = У - 1;
	ИначеЕсли НаправлениеДвижения = "Вниз" Тогда
		У = У + 1;
	ИначеЕсли НаправлениеДвижения = "Влево" Тогда
		Х = Х - 1;
	ИначеЕсли НаправлениеДвижения = "Вправо" Тогда
		Х = Х + 1;
	КонецЕсли;
	
	Если Х > ШиринаПоля Тогда
		Х = ШиринаПоля;
	ИначеЕсли Х < 1 Тогда
		Х = 1;
	КонецЕсли;
	
	Если У > ВысотаПоля Тогда
		У = ВысотаПоля;
	ИначеЕсли У < 1 Тогда
		У = 1;
	КонецЕсли;
	
	Сдвинуть(Х, У);
	
	ПерерисоватьИгровоеПоле();

	
КонецПроцедуры

&НаКлиенте
Процедура ПерерисоватьИгровоеПоле()
	
	Если БылоСтолкновение Тогда
		ИгровоеПоле.Область(ВысотаИнформационнойСтроки+1, 1, ВысотаИнформационнойСтроки+ВысотаПоля, ШиринаПоля).ЦветФона = WebЦвета.Красный;
		Сигнал();
	ИначеЕсли ВзялМонетку Тогда
		ИгровоеПоле.Область(ВысотаИнформационнойСтроки+1, 1, ВысотаИнформационнойСтроки+ВысотаПоля, ШиринаПоля).ЦветФона = WebЦвета.Бирюзовый;
	Иначе
		ИгровоеПоле.Область(ВысотаИнформационнойСтроки+1, 1, ВысотаИнформационнойСтроки+ВысотаПоля, ШиринаПоля).ЦветФона = WebЦвета.БледноЗеленый;
	КонецЕсли;
	
	ИгровоеПоле.Область(ВысотаИнформационнойСтроки+1, 1, ВысотаИнформационнойСтроки+ВысотаПоля, 1).ЦветФона = WebЦвета.Коричневый;
	ИгровоеПоле.Область(ВысотаИнформационнойСтроки+1, ШиринаПоля, ВысотаИнформационнойСтроки+ВысотаПоля, ШиринаПоля).ЦветФона = WebЦвета.Коричневый;
	
	ИгровоеПоле.Область(ВысотаИнформационнойСтроки+1, 1, ВысотаИнформационнойСтроки+1, ШиринаПоля).ЦветФона = WebЦвета.Коричневый;
	ИгровоеПоле.Область(ВысотаИнформационнойСтроки+ВысотаПоля, 1, ВысотаИнформационнойСтроки+ВысотаПоля, ШиринаПоля).ЦветФона = WebЦвета.Коричневый;
	
	Для ИндексСегмента = 0 по Змейка.Количество()-1 Цикл
		Сегмент = Змейка[ИндексСегмента];
		ИгровоеПоле.Область(ВысотаИнформационнойСтроки+Сегмент.У, Сегмент.Х, ВысотаИнформационнойСтроки+Сегмент.У, Сегмент.Х).ЦветФона = ЦветСегмента(Змейка.Количество(), ИндексСегмента);
	КонецЦикла;
	
	Для ИндексМонетки = 0 по Монетки.Количество()-1 Цикл
		Монетка = Монетки[ИндексМонетки];
		ИгровоеПоле.Область(ВысотаИнформационнойСтроки+Монетка.У, Монетка.Х, ВысотаИнформационнойСтроки+Монетка.У, Монетка.Х).ЦветФона = WebЦвета.Бирюзовый;
	КонецЦикла;
	
	ИгровоеПоле.Область(ВысотаИнформационнойСтроки, 1, ВысотаИнформационнойСтроки, 1).Текст = "Змейка " + Змейка.Количество() + " из " + ДлинаЗмейкиДляПобеды;

КонецПроцедуры

&НаКлиенте
Функция ЦветСегмента(ДлинаЗмейки, ИндексСегмента)
	ЗначениеКомпоненты = (ИндексСегмента) / ДлинаЗмейки * 255;
	Возврат Новый Цвет(255, 255, ЗначениеКомпоненты);
КонецФункции

&НаКлиенте
Процедура Сдвинуть(Х, У)
	
	ДлинаЗмейки = Змейка.Количество();
	
	НоваяЗмейка = Новый Массив(ДлинаЗмейки);
	НоваяЗмейка[0] = НовыйКоординаты(Х,У);
	
	Для Сегмент = 1 по ДлинаЗмейки-1 Цикл
		НоваяЗмейка[Сегмент] = Змейка[Сегмент-1];
	КонецЦикла;
	
	БылоСтолкновение = ЕстьСтолкновение(НоваяЗмейка);
	
	Если БылоСтолкновение Тогда
		НоваяЗмейка.Удалить(0);
	Иначе
		ВзялМонетку = ВзятьМонетку(НоваяЗмейка);
	КонецЕсли;
	
	Если ВзялМонетку Тогда
		НоваяЗмейка.Добавить(Змейка[ДлинаЗмейки-1]);
	КонецЕсли;
	
	ПроверитьЗавершитьИгру(НоваяЗмейка);
	
	ДобавитьМонетки();
	
	Змейка = НоваяЗмейка;
	
КонецПроцедуры

&НаКлиенте
Процедура ПроверитьЗавершитьИгру(Змейка)
	Если ВИгре <> Истина Тогда
		Возврат;
	КонецЕсли;
	
	Если Змейка.Количество() = 0 Тогда
		ВариантыОтветов = Новый СписокЗначений;
		ВариантыОтветов.Добавить(КодВозвратаДиалога.Да, "Да, на этот раз должно повести");
		ВариантыОтветов.Добавить(КодВозвратаДиалога.Нет, "Нет, пойду плакать");
		
		Оповещение = Новый ОписаниеОповещения("ЗавершитьИгру", ЭтаФорма);
		ПоказатьВопрос(Оповещение, "Попробовать еще раз?", ВариантыОтветов, , , "Сокрушительная геополитическая Победа!");
		ВИгре = Ложь;
	ИначеЕсли Змейка.Количество() = ДлинаЗмейкиДляПобеды Тогда
		ВариантыОтветов = Новый СписокЗначений;
		ВариантыОтветов.Добавить(КодВозвратаДиалога.Да, "Да, закреплю победу");
		ВариантыОтветов.Добавить(КодВозвратаДиалога.Нет, "Нет, я уже и так чемпион");
		
		Оповещение = Новый ОписаниеОповещения("ЗавершитьИгру", ЭтаФорма);
		ПоказатьВопрос(Оповещение, "Сыграть еще раз?", ВариантыОтветов, , , "Победа!");
		ВИгре = Ложь;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗавершитьИгру(КодВозврата, ДополнительныеПараметры) Экспорт
	Если КодВозврата = КодВозвратаДиалога.Да Тогда
		НачатьИгру();
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Функция ЕстьСтолкновение(Змейка)
	Возврат ЕстьСтолкновениеСХвостом(Змейка) или ЕстьСтолкновениеСГраницей(Змейка);
КонецФункции

&НаКлиенте
Функция ЕстьСтолкновениеСХвостом(Змейка)
	
	ДлинаЗмейки = Змейка.Количество();
	
	Для Сегмент = 1 по ДлинаЗмейки-2 Цикл
		Для Сегмент2 = Сегмент+1 по ДлинаЗмейки-1 Цикл
			Если Змейка[Сегмент].Х = Змейка[Сегмент2].Х
				и Змейка[Сегмент].У = Змейка[Сегмент2].У Тогда
				Возврат Истина;
			КонецЕсли;
		КонецЦикла;
	КонецЦикла;
	
	Возврат Ложь;
	
КонецФункции

&НаКлиенте
Функция ВзятьМонетку(Змейка)
	
	Для ИндексМонетки = 0 по Монетки.Количество()-1 Цикл
		Если Змейка[0].Х = Монетки[ИндексМонетки].Х
			И Змейка[0].У = Монетки[ИндексМонетки].У Тогда
			Монетки.Удалить(ИндексМонетки);
			Возврат Истина;
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат Ложь;
	
КонецФункции

&НаКлиенте
Процедура ДобавитьМонетки()
	
	Если Монетки.Количество() > 0 Тогда
		Возврат;
	КонецЕсли;
	
	Х = гпсч.СлучайноеЧисло(2, ШиринаПоля-1);
	У = гпсч.СлучайноеЧисло(2, ВысотаПоля-1);
	
	Монетки.Добавить(НовыйКоординаты(Х, У));
	
КонецПроцедуры

&НаКлиенте
Функция ЕстьСтолкновениеСГраницей(Змейка)
	
	Если Змейка[0].Х = 1 или Змейка[0].Х = ШиринаПоля
		или Змейка[0].У = ВысотаИнформационнойСтроки или Змейка[0].У = ВысотаПоля Тогда
		
		Возврат Истина;
	КонецЕсли;
	
	Возврат Ложь;
	
КонецФункции

&НаКлиенте
Функция НовыйКоординаты(Х, У)
	Возврат Новый Структура("Х,У", Х, У);
КонецФункции

&НаКлиенте
Процедура НачатьИгру()
	
	гпсч = Новый ГенераторСлучайныхЧисел;
	
	ДлинаЗмейкиДляПобеды = 10;
	
	ВысотаИнформационнойСтроки = 1;
	ШиринаПоля = 50;
	ВысотаПоля = 25;
	Для Колонка = 1 по ШиринаПоля Цикл
		ИгровоеПоле.Область(,Колонка,,Колонка).ШиринаКолонки = 2;
	КонецЦикла;
	
	Х = Цел(ШиринаПоля / 2);
	У = Цел(ВысотаПоля / 2);
	
	ДлинаЗмейки = 5;
	Змейка = Новый Массив(ДлинаЗмейки);
	Монетки = Новый Массив;
	
	Для ИндексСегмента = 0 по ДлинаЗмейки-1 Цикл
		Змейка[ИндексСегмента] = НовыйКоординаты(Х, У + ИндексСегмента);
	КонецЦикла;
	
	НаправлениеДвижения = "Вверх";
	
	БылоСтолкновение = Ложь;
	
	ВИгре = Истина;
	
	Тик();
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	ВключенТаймер = Истина;
	Оповещение = Новый ОписаниеОповещения("ЗавершитьИгру", ЭтаФорма);
	ПоказатьВопрос(Оповещение, "Начать игру?", РежимДиалогаВопрос.ДаНет);
	
КонецПроцедуры

&НаКлиенте
Процедура ВключитьВыключитьТаймер(Команда)
	
	ВключенТаймер = не ВключенТаймер;
	Если ВключенТаймер Тогда
		Тик();
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура Тик() Экспорт
	
	Обновить();
	
	Если ВключенТаймер Тогда
		ПодключитьОбработчикОжидания("Тик", 0.1, Истина);
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура НачатьИгруКлик(Команда)
	НачатьИгру();
КонецПроцедуры

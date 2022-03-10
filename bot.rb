require File.expand_path('../config/environment', __dir__)

require 'telegram/bot'

token = "2140200622:AAHAtQbeFSVyQKUi86pR8GJKRQYMKqkS4mQ"
answers = [
  #emoji
  "😀",
  "🤑",
  "🥰",
  "😜",
  "😎",
    
  # Положительные
  "Бесспорно",
  "Предрешено",
  "Никаких сомнений",
  "Определённо да",
  "Можешь быть уверен в этом",

  # Нерешительно положительные
  "Мне кажется — «да»",
  "Вероятнее всего",
  "Хорошие перспективы",
  "Знаки говорят — «да»",
  "Да",

  # Нейтральные
  "Пока не ясно, попробуй снова",
  "Спроси позже",
  "Лучше не рассказывать",
  "Сейчас нельзя предсказать",
  "Сконцентрируйся и спроси опять",

  # Отрицательные
  "Даже не думай",
  "Мой ответ — «нет»",
  "По моим данным — «нет»",
  "Перспективы не очень хорошие",
  "Весьма сомнительно"
]

Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
        case message.text
        when '/start'
            bot.api.send_message(
            chat_id: message.chat.id,
            text: "Hello, #{message.from.first_name}")
        when '/stop'
            bot.api.send_message(
            chat_id: message.chat.id,
            text: "Bye, #{message.from.first_name}")
        else 
            bot.api.send_message(
                chat_id: message.chat.id, 
                text: answers.sample
                )
        end
    end

end


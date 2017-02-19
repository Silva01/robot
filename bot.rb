require 'telegram/bot'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

token = "344123508:AAEah1Opmb15zqc9GHYGL1hgC2xGtYrhtRQ"

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Não me pertube")
    when '/help'
      bot.api.send_message(chat_id: message.chat.id, text: "Não me pegunte!, pesquise no Google")
    when '/socorro'
      bot.api.send_message(chat_id: message.chat.id, text: "Tenho cara de Hospital de Base ?, se vira sozinho")
    when '/menu'
          kb = [
        Telegram::Bot::Types::KeyboardButton.new(text: '/start', reply_markup:'/start'),
        Telegram::Bot::Types::KeyboardButton.new(text: '/help', reply_markup:'/help'),
        Telegram::Bot::Types::KeyboardButton.new(text: '/socorro', reply_markup:'/socorro')
      ]
      markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb)
      bot.api.send_message(chat_id: message.chat.id, text: 'Menu!', reply_markup: markup)
    end
  end
end

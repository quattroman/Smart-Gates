# -*- coding: utf-8 -*- 
import config 
import telebot 
import os 
import time 
import requests 
import subprocess 
import simplejson 
import sys 
from telegram import InlineKeyboardButton, InlineKeyboardMarkup 
from telebot import types 
bot = telebot.TeleBot(config.token) 
@bot.message_handler(content_types=["text"]) 
def any_msg(message): 
   keyboard = types.InlineKeyboardMarkup() 
   callback_button1 = types.InlineKeyboardButton(text="Gate-1", callback_data="open") 
   callback_button2 = types.InlineKeyboardButton(text="Gate-2", callback_data="open2") 
   callback_button3 = types.InlineKeyboardButton(text="Photo", callback_data="photo") 
#    callback_button3 = types.InlineKeyboardButton(text="Add car", callback_data="add") 
   keyboard.add(callback_button1,callback_button2,callback_button3) 
   bot.send_message(message.chat.id, "Welcome to the xGates", reply_markup=keyboard) 
@bot.callback_query_handler(func=lambda call: True) 
def callback_inline(call): 
   if call.message: 
       if call.data == "open": 
           os.system("cat </dev/null |sh /home/user/Downloads/autocheck/relay-control/open.sh 2>/dev/null") 
   if call.message: 
       if call.data == "open2": 
           os.system("cat </dev/null |sh /home/user/Downloads/autocheck/relay-control/open2.sh 2>/dev/null") 
   if call.message: 
       if call.data == "photo": 
           os.system("sh /home/user/Downloads/autocheck/tgphoto.sh xGates /home/user/Downloads/autocheck/output.jpg > log.out 2> /dev/null") 
   if call.message: 
       if call.data == "close": 
           os.system("cat </dev/null |sh /home/user/Downloads/autocheck/relay-control/close.sh 2>/dev/null") 
   if call.message: 
       if call.data == "add": 
           os.system("cat </dev/null |sh /home/user/Downloads/autocheck/relay-control/add.sh 2>/dev/null") 
def run(self): 
       while True: 
           self.updates() 
           time.sleep(1) 
if __name__ == '__main__': 
   bot.polling(none_stop=True) 

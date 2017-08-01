#!/bin/bash
  to=$1
  msg=$2
  tgpath=/home/swink/tg
  cd ${tgpath}
 #dialog_list  | ${tgpath}/bin/telegram-cli -k tg-server.pub -W
  (sleep 1; echo "dialog_list";sleep 1; echo "send_photo $to $msg";) | ${tgpath}/bin/telegram-cli -k -W tg-server.pub



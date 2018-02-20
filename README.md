# Homework 05

`ssh -i /home/alex/.ssh/appuser -A -t appuser@35.204.162.204 ssh 10.164.0.3`

`bastion: Internal IP 10.164.0.2, External IP 35.204.162.204
someinternalhost: Internal IP 10.164.0.3`

# Homework 07

Реализовал шаблоны пакера:
* ubuntu16.json - базовый образ с предустановленным ruby и mongodb
* immutable.json - готовый образ с приложением

Запуск приложения при старте реализован через rc.local


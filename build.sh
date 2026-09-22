#!/bin/sh
# Собирает index.html (для своего хостинга) из page.html
cd "$(dirname "$0")"
python3 - <<'PY'
import re
p=open('page.html').read()
head='''<!doctype html>
<html lang="ru">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="description" content="Урок немецкого: как спросить дорогу и объяснить маршрут. zum/zur, links/rechts, императив, интерактивная карта и тест. От Stellas.">
<meta name="theme-color" content="#014CFF">
<link rel="icon" href="media/logo.png">
'''
m=re.search(r'</style>\n',p)
open('index.html','w').write(head+p[:m.end()]+'</head>\n<body>\n'+p[m.end():]+'</body>\n</html>\n')
PY

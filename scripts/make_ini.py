#!/usr/bin/python

import re

ini_fn    = 'chronos_zxbeeper.ini'
ini_tn    = 'chronos_zxbeeper.ini.txt'
symbol_fn = 'chronos_zxbeeper.sym'

load_name = 'Music_Data'
init_name = 'Music_Init'

ay_author = 'Tim Follin'
ay_copy   = '(c) 1987 Mastertronic'
ay_name   = 'Chronos - Title (Beeper)'
ay_file   = 'chronos_zxbeeper.bin'

load_re = re.compile(r'<'+load_name+'>')
init_re = re.compile(r'<'+init_name+'>')
sym_re  = re.compile(r'([0-9_A-Za-z]+)\s+EQU ([0-9a-zA-Z]{5})H')
load_addr = 0
init_addr = 0

with open(symbol_fn, "r") as symbol_file:
	l = symbol_file.readline().strip()
	while l:
		n,v = re.match(sym_re,l).groups()
		if n == load_name:
			load_addr = int(v, 16)
		if n == init_name:
			init_addr = int(v, 16)
		l = symbol_file.readline().strip()

with open(ini_tn, "r") as ini_template:
	with open(ini_fn, "w", newline='\r\n') as ini_file:
		template = ini_template.read()
		template = re.sub(load_re, str(load_addr), template)
		template = re.sub(init_re, str(init_addr), template)
		ini_file.write(template)

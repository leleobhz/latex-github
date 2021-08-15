#General Makefile for latex
#Makes ps and pdf
#Can also make html
#Works on all *.tex files in directory
#$Id: Makefile.latex,v 1.4 2009-05-25 14:07:01 john Exp $

#initally written jcv 06/16/2005
#v1.0
#I had wrong version up that looked for main.tex
#now it does any .tex files in a directory
#09/15/2006
#v1.1
#It is no longer necessary to comment or uncomment biber.
#Makefile works if you need biber or not.
#05/02/2007
#v1.2
#11/05/2007
#v1.3
#Can now use pdf target to make pdf directly with pdflatex
#Also does everything in batchmode to clean up screen output
#05/15/2009
#v1.4
#make clean was missing a generated file before

#Copyright 2005-2009 John C. Vernaleo

#               (my_first_name)@netpurgatory.com
#                               or
#               (my_last_name)@astro.umd.edu
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

#see readme_makefile.latex.txt for more information and gpl.txt for a
#copy of the GPL

#Possible targets are:
#all, html, words, clean, cleaner, htmlclean, pdf

RM = rm -rf

# by Kreutz: this improves the clean command by looking into all sub dirs
FINDANDRMAUX = rm -f `find . -type f | grep -E "(*.aux|*.bak)"`

ALLTEX = ${wildcard *.tex}
# Caso documento seja mono arquivo, é possível permitir o wildcard
# Do contrário, é preciso sim especificar quem é o documento principal.
# Por isso existe o BASE e o FILES.
#BASE = ${wildcard *.tex}
BASE = arquivoPrincipal.tex
FILES = ${BASE:%.tex=%.pdf}

#LOPT =	-interaction=batchmode
#LOPT2 = -shell-escape ${LOPT}

LOPT = -shell-escape

on_docker:
	./miktex.sh make all

all:   clean trash pdf

trash:	
	sh removetrash.sh 

%.pdf:	*.tex
	lualatex ${LOPT} $*
	- biber $*
	lualatex ${LOPT} $*
	lualatex ${LOPT} $*

html:	${BASE:%.tex=%}

%:	%.tex
	t4ht $*

words:	${BASE:%.tex=%}

%:	%.tex
	lualatex ${LOPT} $*
	dvips -q -o - $*.dvi | ps2ascii | wc -w
	@echo "words in $*"
	@echo ""

clean:
	${FINDANDRMAUX}
	${RM} ${ALLTEX:%.tex=%.log}
	${RM} ${ALLTEX:%.tex=%.dvi}	
	${RM} ${ALLTEX:%.tex=%.ps}
	${RM} ${ALLTEX:%.tex=%.pdf}
	${RM} ${ALLTEX:%.tex=%.html}
	${RM} ${ALLTEX:%.tex=%.blg}
	${RM} ${ALLTEX:%.tex=%.toc}
	${RM} ${ALLTEX:%.tex=%.bbl}
	${RM} ${ALLTEX:%.tex=%.aux}
	${RM} ${ALLTEX:%.tex=%.lof}
	${RM} ${ALLTEX:%.tex=%.lot}
	${RM} ${ALLTEX:%.tex=%.out}
	${RM} ${ALLTEX:%.tex=%.bcf}
	${RM} ${ALLTEX:%.tex=%.nlo}
	${RM} ${ALLTEX:%.tex=%.run.xml}
	${RM} ${ALLTEX:%.tex=%.tex~}
	${RM} texput.log

cleaner: clean
	${RM} ${ALLTEX:%.tex=%.bbl}
	${RM} ${FILES}

htmlclean:
	${RM} ${ALLTEX:%.tex=%/}

pdf:	${BASE:%.tex=%}

%:	%.tex
	lualatex ${LOPT} $*
	- biber $*
	lualatex ${LOPT} $*
	lualatex ${LOPT} $*

help:
	@echo Type "'make help'         To see this list"
	@echo Type "'make all'          To generate ps and pdf"
	@echo Type "'make pdf'          To generate pdf directly"
	@echo Type "'make html'         To generate html"
	@echo Type "'make clean'        To remove generated files except pdf"
	@echo Type "'make cleaner'      To remove ALL generated files"
	@echo Type "'make htmlclean'    To remove generated html files"
	@echo Type "'make words'        To get an estimate of word count"

for i in `find . -name \*.tex`
do
# Com o template IFCH, *NAO CONVERTER DE NENHUMA FORMA PRA ISO*
# O template já resolve os simbolos em utf8

#	sh convertToISO-8859-1.sh $i
#	sh convertFromISO-8859-1ToUTF8.sh $i
	true
done

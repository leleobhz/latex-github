[ $1 ] && [ -f $1 ] || { echo "Usage: $0 file.tex"; exit; }
RESULT=`file --mime $1 | grep -i "charset=utf-8"`
if [ "$RESULT" != "" ]
then
	echo "Converting file $1 from UTF-8 to ISO-8859-1 ..."
	iconv -t ISO-8859-1 -f utf-8 < $1 > $1.iso; mv $1.iso $1
fi

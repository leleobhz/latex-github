[ $1 ] && [ -f $1 ] || { echo "Usage: $0 file.tex"; exit; }
RESULT=`file --mime $1 | grep -i "charset=iso-8859-1"`
if [ "$RESULT" != "" ]
then
	echo "Converting file $1 from UTF-8 to ISO-8859-1 ..."
	iconv -t utf-8 -f ISO-8859-1 < $1 > $1.iso; mv $1.iso $1
fi

#!/bin/sh

if [ $# -lt 1 ]; then
	echo "Usage: <command> <file> [options]"
	echo "Commands: tex pdf shell"
	exit 1
fi

cmd="$1"; shift

if [ "$cmd" = "shell" ]; then
    if [ $# -lt 1 ]; then
        /bin/sh
        exit $?
    fi
	/bin/sh -c "$*"
	exit $?
fi

if [ $# -lt 1 ]; then
	echo "Error: Did not specify input file"
	exit 1
fi

file="$1"; shift

if [ "$cmd" = "tex" ]; then
	outfile=$(echo "$file" | sed 's/.md$/.tex/')
	pandoc --data-dir=/var/lib/pandoc --template=eisvogel.latex --from gfm+smart --to latex -o "$outfile" "$file" $*
	exit $?
fi

if [ "$cmd" = "pdf" ]; then
	outfile=$(echo "$file" | sed 's/.md$/.pdf/')
	pandoc --data-dir=/var/lib/pandoc --template=eisvogel.latex --from gfm+smart --to pdf -o "$outfile" "$file" $*
	exit $?
fi

echo "Error: Invalid command"
exit 1

#! /bin/bash

# -- game_intllib/tools/xgettext.sh

me=$(basename "${BASH_SOURCE[0]}");

if [[ $# -lt 1 ]]; then
	echo "Usage: $me FILE..." >&2;
	exit 1;
fi

GLOCALE="./game_intllib/locale/"
mkdir -p ${GLOCALE};
echo "Generating template in ${GLOCALE} folder..." >&2;
xgettext --from-code=UTF-8 \
		--keyword=S \
		--keyword=NS:1,2 \
		--keyword=N_ \
		--add-comments='Translators:' \
		--add-location=file \
		-o ${GLOCALE}template.pot \
		"$@" \
		|| exit;

find ${GLOCALE} -name '*.po' -type f | while read -r file; do
	echo "Updating $file..." >&2;
	msgmerge --update "$file" ${GLOCALE}template.pot;
done

echo "DONE!" >&2;

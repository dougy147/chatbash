#!/bin/bash

set -xe

# Directory where chatbash configuration files are stored and read
CONF_DEST="\${HOME}/.config/chatbash"

rm -r ./build 2>/dev/null; mkdir ./build 2>/dev/null
echo "#!/bin/bash" >> ./build/chatbash
echo "CONF_DEST=\"${CONF_DEST}\"" >> ./build/chatbash
echo "CONF_FILE=\"\${CONF_DEST}/chatbash.conf\"" >> ./build/chatbash
echo "source \"\${CONF_FILE}\"" >> ./build/chatbash
for conf in ./conf/*.conf; do
	if [[ $(grep "chatbash.conf" <<< "$conf") ]]; then
		continue;
	fi;
	cat $conf | sed '/^#/d' >> ./build/chatbash;
done
for func in ./func/*; do
	if [[ $(grep "chatbash" <<< "$func") ]]; then
		continue;
	fi;
	cat $func | sed '/^#/d' >> ./build/chatbash;
done
cat ./func/chatbash | sed '/^#/d' >> ./build/chatbash
sed -i '/^$/d;/^[\t]#/d' ./build/chatbash
mv ./build/chatbash .
rm -r ./build 2>/dev/null
chmod +x ./chatbash

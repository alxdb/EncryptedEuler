decrypt () {
	i=1
	for file in $1/*.$2.enc; do
		export PASS=$(sed $i'!d' answers.txt)
		if [ -z $PASS ]; then
			echo "no more answers"
			return 0
		else
			echo "decrypting $file with $PASS"
		fi
		openssl aes-128-cbc -md md5 -d -in $file -out ${file%.enc} -pass env:PASS 2>/dev/null
		if [ $? -ne 0 ]; then
			echo "decryption failed"
			return 1
		else
			echo "decrypted $file"
		fi
		i=$((i + 1))
	done
}

decrypt C c
decrypt Python py
decrypt Haskell hs

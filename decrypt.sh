# decrypt C
cd C
i=0
for file in *.c.enc; do
	i=$((i + 1))
	export PASS=$(sed $i'!d' ../answers.txt)
	openssl aes-128-cbc -d -in ${file} -out ${file%.enc} -pass env:PASS
	echo "decrypted ${file}"
done
cd ..

# decrypt Python
cd Python
i=0
for file in *.py.enc; do
	i=$((i + 1))
	export PASS=$(sed $i'!d' ../answers.txt)
	openssl aes-128-cbc -d -in ${file} -out ${file%.enc} -pass env:PASS
	echo "decrypted ${file}"
done
cd ..

# decrypt Haskell
cd Haskell
i=0
for file in *.hs.enc; do
	i=$((i + 1))
	export PASS=$(sed $i'!d' ../answers.txt)
	openssl aes-128-cbc -d -in ${file} -out ${file%.enc} -pass env:PASS
	echo "decrypted ${file}"
done
cd ..

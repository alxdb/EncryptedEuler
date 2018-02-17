# encrypt C
cd C
i=0
make clean
for file in *.c; do
	i=$((i + 1))
	export PASS=$(sed $i'!d' ../answers.txt)
	openssl aes-128-cbc -in ${file} -out ${file}.enc -pass env:PASS
	rm ${file}
	echo "encrypted ${file}"
done
cd ..

# encrypt Python
cd Python
i=0
for file in *.py; do
	i=$((i + 1))
	export PASS=$(sed $i'!d' ../answers.txt)
	openssl aes-128-cbc -in ${file} -out ${file}.enc -pass env:PASS
	rm ${file}
	echo "encrypted ${file}"
done
cd ..

# encrypt Haskell
cd Haskell
i=0
for file in *.hs; do
	i=$((i + 1))
	export PASS=$(sed $i'!d' ../answers.txt)
	openssl aes-128-cbc -in ${file} -out ${file}.enc -pass env:PASS
	rm ${file}
	echo "encrypted ${file}"
done

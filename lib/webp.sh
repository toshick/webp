#!/bin/sh

read -p "img path? (y/N): " imgpath

if [ -e $imgpath ]; then
    # 存在する場合
    echo "target dir -> ${imgpath}"
    cd $imgpath
else
    # 存在しない場合
    echo 'not exist'
    exit
fi

find -E . -type f -regex '.*\.(png|jpg)' -print0 | xargs -0 -I{} cwebp -q 90 {} -o {}.webp

rm -rf webp
mkdir webp
for f in ./*.webp
do
    mv $f webp/`echo ${f} | sed -E 's/\.(png|jpg)\.webp/.webp/'`
done

#!/bin/sh

cd /users/tutors/mhtest15/share/testsuite/ORahilly/06.Ballylongford

for i in *008*.jpg
 do

  djpeg  -scale 1/8 -bmp $i | cjpeg > /users/ca1/zuoq2/stuff/$i

done

#!/bin/bash
pause()
{
echo "Press any key to quit:"
read -n1 -s key
exit 1
}
echo "start to make update.img..."
if [ ! -f "parameter" ]; then
	echo "Error:No found parameter!"
	pause
fi
if [ ! -f "package-file" ]; then
	echo "Error:No found package-file!"
	pause
fi
./afptool -pack ./ Image/update.img || pause
./rkImageMaker -RK29 RK3288UbootLoader_V2.30.10.bin Image/update.img update.img -os_type:androidos || pause
echo "Making update.img OK."
echo "Press any key to quit:"
read -n1 -s key << EOF
y
EOF
exit 0

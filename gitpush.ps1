$FileName = (Get-Date).tostring("dd-MM-yyyy hh:mm:ss")  
cd B:\Development\neo\neog
git add .
git commit -m "$FileName"
git push origin main

cd B:\Development\ByteXL_c-language
git add .
git commit -m "$FileName"
git push origin main

cd B:\Development\java-intellij
git add .
git commit -m "$FileName"
git push origin main


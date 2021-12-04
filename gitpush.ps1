#To push files to remote with commit name as the commit date and time.
$FileName = (Get-Date).tostring("dd-MM-yyyy hh:mm:ss")  
cd "Path to git repo"
git add .
git commit -m "$FileName"     #makes a commit with commit message as current date and time
git push origin main

cd "Path to git repo1.."
git add .
git commit -m "$FileName"
git push origin main

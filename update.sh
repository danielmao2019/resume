version=3.3
mv resume.pdf resume_${version}.pdf
cp resume_${version}.pdf resume_Daniel_Mao.pdf
git add .
git commit -m "resume version ${version}"

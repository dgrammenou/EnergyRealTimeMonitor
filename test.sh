arr_="energy-livedeploy"

IFS='/'

read -ra arr <<< "$arr_"

printf "${arr[0]}\n"



PASSED=$1
X=$(pwd)
IFS='.'
if [[ -d $PASSED ]]; then
  cd "$PASSED"
  if [[ "$2" == "-c" || "$2" == "--copy" ]]; then
    for file in *
    do
      if [[ -f $file ]]; then
        TE=$(date +%F)
        cp "$file" "${TE}_${file}" 
        read -a strarr <<< "$file"
        echo "name: $file type: ${strarr[1]}   -> making copy: ${TE}_${file}"
      fi
    done
  elif [ -z ${2+x} ]; then
    for file in *
    do
      if [[ -f $file ]]; then
        TE=$(date +%F)
        mv "$file" "${TE}_${file}"
        read -a strarr <<< "$file"
        echo "name: $file type: ${strarr[1]}   -> changing name to: ${TE}_${file}"
      fi
    done
  fi
else
  echo "No such directory"
fi

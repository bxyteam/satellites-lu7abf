#!/bin/bash

IT_DIR="/var/satellite/data/github/it"
PASOS_DIR="/var/satellite/data/pasos"
PASOS_HTML_DIR="${PASOS_DIR}/html"
PASOS_TXT_DIR="${PASOS_DIR}/txt"
JAVA_KEPS_UPDATER_DIR="/var/satellite/data/github/keps_updater"
JAVA_KEPS_DIR="/var/satellite/data/github/keps"
SCRIPTS_DIR="/var/satellite/data/github/scripts"
WEB_DIR="/var/satellite/data/web"

mkdir -p ${PASOS_DIR}

chmod -R ugo+rwx ${IT_DIR}
chmod -R ugo+rwx ${PASOS_DIR}

mkdir -p ${PASOS_HTML_DIR} ${PASOS_TXT_DIR} 

shopt -s nocaseglob
htm_files=(${IT_DIR}/pasos*.htm)
txt_files=(${IT_DIR}/pasos*.txt)
shopt -u nocaseglob

copy_and_lowercase() {
    local target_dir="$1"
    shift
    for file in "$@"; do
        if [[ ! -f "$file" ]]; then
            echo "[ERROR] File does not exist: $file"
            continue
        fi

        base=$(basename "$file")
        ext="${base##*.}"
        name="${base%.*}"
        lower_name=$(echo "$name" | tr '[:upper:]' '[:lower:]')
        lower_ext=$(echo "$ext" | tr '[:upper:]' '[:lower:]')

        # Convert .htm to .html
        if [[ "$lower_ext" == "htm" ]]; then
            lower_ext="html"
        fi

        new_file="${lower_name}.${lower_ext}"
        cp -f "$file" "$target_dir/$new_file"
    done
}

# Process HTML files
if (( ${#htm_files[@]} )); then
    copy_and_lowercase $PASOS_HTML_DIR "${htm_files[@]}"
else
    echo "[WARNING] $(date '+%Y-%m-%d %H:%M:%S') - No matching .htm files found."
fi

# Process TXT files
if (( ${#txt_files[@]} )); then
    copy_and_lowercase ${PASOS_TXT_DIR} "${txt_files[@]}"
else
    echo "[WARNING] $(date '+%Y-%m-%d %H:%M:%S') - No matching .txt files found."
fi


echo "Preparing to compile and run the program..."
#Execute java update keps
rm -R ${JAVA_KEPS_UPDATER_DIR}/target
mkdir -p ${JAVA_KEPS_UPDATER_DIR}/target
javac -d ${JAVA_KEPS_UPDATER_DIR}/target ${JAVA_KEPS_UPDATER_DIR}/src/amsat/*.java
java -cp ${JAVA_KEPS_UPDATER_DIR}/target amsat.KepsUpdateRunner


chmod -R ugo+rwx ${PASOS_DIR}

# Loop through all .html files in the directory
find "$PASOS_HTML_DIR" -type f -name '*.html' | while read -r file; do
    echo "Sanitizing: $file"
    
    # Temporary file
    tmpfile=$(mktemp)

    # Convert encoding and replace � with a space
    iconv -f WINDOWS-1252 -t UTF-8 "$file" 2>/dev/null | sed 's/�/ /g' > "$tmpfile"

    # Check if iconv succeeded
    if [ $? -eq 0 ]; then
        mv "$tmpfile" "$file"
    else
        echo "Failed to convert: $file"
        rm "$tmpfile"
    fi
done

# Set the pattern and header (ensure escaping is correct for AWK)
pattern='<DIV ID=top NAME=top>Pasos satelites amateur por</DIV>'

# It's easier to read and maintain the header in a separate file or a multi-line string
read -r -d '' header <<'EOF'
<head><META HTTP-EQUIV='EXPIRES' CONTENT='+4 days'><META HTTP-EQUIV='Pragma' CONTENT='no-cache'><META HTTP-EQUIV='Cache-Control' CONTENT='no-cache'>
<style type='text/css'>.txt {font-family:Courier New,Courier;font-size:12;font-weight:bold;line-height:13px;}
A:visited {color:#000000}A:link{color:#000000}A:hover{color:#ff0000}A:active{color:#000000}
.yel1 {font-family:Courier New,Courier;font-size:12;font-weight:bold;line-height:13px;background:#ffff00;}
.mag1 {font-family:Courier New,Courier;font-size:12;font-weight:bold;line-height:13px;background:#00ffff;}
.red1 {font-family:Courier New,Courier;font-size:12;font-weight:bold;line-height:13px;background:#00ff00;}
.titg {font-family:Courier New,Courier;font-size:17;font-weight:bold;line-height:17px;color:#ffffff;background:#6789bc;}
.txt {margin-left:3;margin-right:1;margin-top:1;border:0;font-weight:bold;}
.pnk1 {font-family:Courier New,Courier;font-size:12;font-weight:bold;line-height:13px;background:#ffe5c0;}</style>
<title>Pasos Satelites Amsat Argentina</title>
<script>
const openLinkInNewTab = (event, sat) => { event.preventDefault(); const hostUrl = `${new URL(window.parent.window.location.href).origin}`;
const a = document.createElement('a'); a.href = `${hostUrl}/pass?template=share/assets/${sat}.html`; a.target = '_blank'; a.rel = 'noopener noreferrer';
a.click();a.remove();}</script></head><body class=txt onselectstart='return false' ondragstart='return false'>
EOF

# Loop over each HTML file
for file in "$PASOS_HTML_DIR"/*.html; do
    echo "Processing $file..."
    
    awk -v pat="$pattern" -v header="$header" '
    {
        idx = index($0, pat)
        if (idx > 0) {
            print header
            print substr($0, idx)
            found = 1
            next
        }
        if (found) print
    }
    ' "$file" > "${file}.new"

    mv "${file}.new" "$file"
done

echo "Processing complete."


BODY_START_MARKER='@@</A><br><br>'
BODY_END_MARKER='<DIV ID=iss NAME=iss>'

read -r -d '' body <<'EOF'
<A ID='iss1' NAME='iss1' href="#" onclick="openLinkInNewTab(event, 'satiss')" >ISS  &nbsp;</A>&nbsp; <A ID='ao-71' NAME='ao-71' href="#" onclick="openLinkInNewTab(event, 'satao-7')">AO-07</A>&nbsp; <A ID='uo-111' NAME='uo-111' href="#" onclick="openLinkInNewTab(event, 'satuo-11')">UO-11</A>&nbsp; <A ID='lo-191' NAME='lo-191' href="#" onclick="openLinkInNewTab(event, 'satlo-19')" >LO-19</A><BR>
<A ID='ao-271' NAME='ao-271' href="#" onclick="openLinkInNewTab(event, 'satao27')" >AO-27</A>&nbsp; <A ID='fo-291' NAME='fo-291' href="#" onclick="openLinkInNewTab(event, 'satfo-29')" >FO-29</A>&nbsp; <A ID='go-321' NAME='go-321' href="#" onclick="openLinkInNewTab(event, 'satgo-32')">GO-32</A>&nbsp; <A ID='no-441' NAME='no-441' href="#" onclick="openLinkInNewTab(event, 'satno-44')" >NO-44</A><BR>
<A ID='so-501' NAME='so-501' href="#" onclick="openLinkInNewTab(event, 'satso-50')">SO-50</A>&nbsp; <A ID='co-551' NAME='co-551' href="#" onclick="openLinkInNewTab(event, 'satco-55')">CO-55</A>&nbsp; <A ID='co-571' NAME='co-571' href="#" onclick="openLinkInNewTab(event, 'satco-57')" >CO-57</A>&nbsp; <A ID='co-581' NAME='co-581' href="#" onclick="openLinkInNewTab(event, 'satco-58')" >CO-58</A><BR>
<A ID='co-651' NAME='co-651' href="#" onclick="openLinkInNewTab(event, 'satco-65')" >CO-65</A>&nbsp; <A ID='co-661' NAME='co-661' href="#" onclick="openLinkInNewTab(event, 'satco-66')">CO-66</A>&nbsp; <A ID='ho-681' NAME='ho-681' href="#" onclick="openLinkInNewTab(event, 'satho-68')" >HO-68</A>&nbsp; <A ID='ao-731' NAME='ao-731' href="#" onclick="openLinkInNewTab(event, 'satao-73')" >AO-73</A><BR>
<A ID='lo-741' NAME='lo-741' href="#" onclick="openLinkInNewTab(event, 'satlo-74')" >LO-74</A>&nbsp; <A ID='eo-791' NAME='eo-791' href="#" onclick="openLinkInNewTab(event, 'sateo-79')" >EO-79</A>&nbsp; <A ID='eo-801' NAME='eo-801' href="#" onclick="openLinkInNewTab(event, 'sateo-80')" >EO-80</A>&nbsp; <A ID='ao-851' NAME='ao-851' href="#" onclick="openLinkInNewTab(event, 'satao-85')" >AO-85</A><BR>
<A ID='io-861' NAME='io-861' href="#" onclick="openLinkInNewTab(event, 'satio-86')" >IO-86</A>&nbsp; <A ID='ao-911' NAME='ao-911' href="#" onclick="openLinkInNewTab(event, 'satao-91')" >AO-91</A>&nbsp; <A ID='ao-951' NAME='ao-951' href="#" onclick="openLinkInNewTab(event, 'satao-95')" >AO-95</A>&nbsp; <A ID='po1011' NAME='po1011' href="#" onclick="openLinkInNewTab(event, 'satpo101')" >PO101</A><BR>
<A ID='ao1091' NAME='ao1091' href="#" onclick="openLinkInNewTab(event, 'satao109')" >AO109</A>&nbsp; <A ID='so1151' NAME='so1151' href="#" onclick="openLinkInNewTab(event, 'satso115')" >SO115</A>&nbsp; <A ID='fo1181' NAME='fo1181' href="#" onclick="openLinkInNewTab(event, 'satfo118')" >FO118</A>&nbsp; <A ID='so1211' NAME='so1211' href="#" onclick="openLinkInNewTab(event, 'satso121')" >SO121</A><BR>
<A ID='rs-151' NAME='rs-151' href="#" onclick="openLinkInNewTab(event, 'satrs-15')" >RS-15</A>&nbsp; <A ID='rs-221' NAME='rs-221' href="#" onclick="openLinkInNewTab(event, 'satrs-22')" >RS-22</A>&nbsp; <A ID='rs-301' NAME='rs-301' href="#" onclick="openLinkInNewTab(event, 'satrs-30')" >RS-30</A>&nbsp; <A ID='rs-401' NAME='rs-401' href="#" onclick="openLinkInNewTab(event, 'satrs-40')" >RS-40</A><BR>
<A ID='rs-441' NAME='rs-441' href="#" onclick="openLinkInNewTab(event, 'satrs-44')" >RS-44</A>&nbsp; <A ID='rs-481' NAME='rs-481' href="#" onclick="openLinkInNewTab(event, 'satrs-48')" >RS-48</A>&nbsp; <A ID='kks-11' NAME='kks-11' href="#" onclick="openLinkInNewTab(event, 'satkks-1')" >KKS-1</A>&nbsp; <A ID='swiss1' NAME='swiss1' href="#" onclick="openLinkInNewTab(event, 'satswiss')" >SWISS</A><BR>
<A ID='itups1' NAME='itups1' href="#" onclick="openLinkInNewTab(event, 'satitups')" >ITUPS</A>&nbsp; <A ID='sprou1' NAME='sprou1' href="#" onclick="openLinkInNewTab(event, 'satsprou')" >SPROU</A>&nbsp; <A ID='tita1' NAME='tita1' href="#" onclick="openLinkInNewTab(event, 'sattita')" >TITA </A>&nbsp; <A ID='tigri1' NAME='tigri1' href="#" onclick="openLinkInNewTab(event, 'sattigri')" >TIGRI</A><BR>
<A ID='ukube1' NAME='ukube1' href="#" onclick="openLinkInNewTab(event, 'satukube')" >UKUBE</A>&nbsp; <A ID='xw-2b1' NAME='xw-2b1' href="#" onclick="openLinkInNewTab(event, 'satxw-2b')" >XW-2B</A>&nbsp; <A ID='xw-2c1' NAME='xw-2c1' href="#" onclick="openLinkInNewTab(event, 'satxw-2c')" >XW-2C</A>&nbsp; <A ID='xw-2d1' NAME='xw-2d1' href="#" onclick="openLinkInNewTab(event, 'satxw-2d')" >XW-2D</A><BR>
<A ID='xw-2e1' NAME='xw-2e1' href="#" onclick="openLinkInNewTab(event, 'satxw-2e')" >XW-2E</A>&nbsp; <A ID='xw-2f1' NAME='xw-2f1' href="#" onclick="openLinkInNewTab(event, 'satxw-2f')" >XW-2F</A>&nbsp; <A ID='xw-31' NAME='xw-31' href="#" onclick="openLinkInNewTab(event, 'satxw-3')" >XW-3 </A>&nbsp; <A ID='cas4a1' NAME='cas4a1' href="#" onclick="openLinkInNewTab(event, 'satcas4a')" >CAS4A</A><BR>
<A ID='cas4b1' NAME='cas4b1' href="#" onclick="openLinkInNewTab(event, 'satcas4b')" >CAS4B</A>&nbsp; <A ID='cas2t1' NAME='cas2t1' href="#" onclick="openLinkInNewTab(event, 'satcast2')" >CAS2T</A>&nbsp; <A ID='lilac1' NAME='lilac1' href="#" onclick="openLinkInNewTab(event, 'satlilac')" >LILAC</A>&nbsp; <A ID='na-151' NAME='na-151' href="#" onclick="openLinkInNewTab(event, 'satna-15')" >NA-15</A><BR>
<A ID='na-181' NAME='na-181' href="#" onclick="openLinkInNewTab(event, 'satna-18')" >NA-18</A>&nbsp; <A ID='na-191' NAME='na-191' href="#" onclick="openLinkInNewTab(event, 'satna-19')" >NA-19</A>&nbsp; <A ID='metoa1' NAME='metoa1' href="#" onclick="openLinkInNewTab(event, 'satmetoa')" >METOA</A>&nbsp; <A ID='metob1' NAME='metob1' href="#" onclick="openLinkInNewTab(event, 'satmetob')" >METOB</A><BR>
<A ID='metoc1' NAME='metoc1' href="#" onclick="openLinkInNewTab(event, 'satmetoc')" >METOC</A>&nbsp; <A ID='metm21' NAME='metm21' href="#" onclick="openLinkInNewTab(event, 'satmetm2')" >METM2</A>&nbsp; <A ID='lapan1' NAME='lapan1' href="#" onclick="openLinkInNewTab(event, 'satlapan')" >LAPAN</A>&nbsp; <A ID='maxva1' NAME='maxva1' href="#" onclick="openLinkInNewTab(event, 'satmaxva')" >MAXVA</A><BR>
<A ID='norbi1' NAME='norbi1' href="#" onclick="openLinkInNewTab(event, 'satnorbi')" >NORBI</A>&nbsp; <A ID='china1' NAME='china1' href="#" onclick="openLinkInNewTab(event, 'satchina')" >CHINA</A>&nbsp; <A ID='teve21' NAME='teve21' href="#" onclick="openLinkInNewTab(event, 'satteve2')" >TEVE2</A>&nbsp; <A ID='teve31' NAME='teve31' href="#" onclick="openLinkInNewTab(event, 'satteve3')" >TEVE3</A><BR>
<A ID='teve41' NAME='teve41' href="#" onclick="openLinkInNewTab(event, 'satteve4')" >TEVE4</A>&nbsp; <A ID='teve51' NAME='teve51' href="#" onclick="openLinkInNewTab(event, 'satteve5')" >TEVE5</A>&nbsp; <A ID='teve61' NAME='teve61' href="#" onclick="openLinkInNewTab(event, 'satteve6')" >TEVE6</A>&nbsp; <A ID='teve71' NAME='teve71' href="#" onclick="openLinkInNewTab(event, 'satteve7')" >TEVE7</A><BR><BR>
EOF

# Loop through all HTML files
for file in "$PASOS_HTML_DIR"/*.html; do
  awk -v start="$BODY_START_MARKER" -v end="$BODY_END_MARKER" -v insert="$body" '
  {
      if (found_end) {
          print
          next
      }

      if (!in_block) {
          if (index($0, start)) {
              print
              print insert
              in_block = 1
              next
          } else {
              print
          }
      }

      if (in_block && index($0, end)) {
          print
          in_block = 0
          found_end = 1
      }
  }
  ' "$file" > "${file}.new" && mv "${file}.new" "$file"
done

# Copy directory contents if it exists
if [ -d "${PASOS_HTML_DIR}" ]; then
    cp -r "${PASOS_HTML_DIR}/." "${WEB_DIR}/share/assets"
else
    echo "Directory ${PASOS_HTML_DIR} does not exist. Skipping copy."
fi

# Copy all.json if it exists
if [ -f "${JAVA_KEPS_DIR}/output/all.json" ]; then
    cp "${JAVA_KEPS_DIR}/output/all.json" "${WEB_DIR}/share/assets"
else
    echo "File all.json not found. Skipping copy."
fi

# Copy keps.txt if it exists
if [ -f "${JAVA_KEPS_DIR}/output/keps.txt" ]; then
    cp "${JAVA_KEPS_DIR}/output/keps.txt" "${WEB_DIR}/share/assets"
else
    echo "File keps.txt not found. Skipping copy."
fi

# Copy nasa.all if it exists
if [ -f "${JAVA_KEPS_DIR}/output/nasa.all" ]; then
    cp "${JAVA_KEPS_DIR}/output/nasa.all" "${IT_DIR}"
else
    echo "File nasa.all not found. Skipping copy."
fi

# Copy spacetrack1.txt if it exists
if [ -f "${JAVA_KEPS_DIR}/output/spacetrack1.txt" ]; then
    cp "${JAVA_KEPS_DIR}/output/spacetrack1.txt" "${JAVA_KEPS_DIR}"
else
    echo "File spacetrack1.txt not found. Skipping copy."
fi


#!/usr/bin/env bash
curl_format=$( cat <<EOF
\n
     time_namelookup:  %{time_namelookup}\n
     time_connect:  %{time_connect}\n
     time_appconnect:  %{time_appconnect}\n
     time_pretransfer:  %{time_pretransfer}\n
     time_redirect:  %{time_redirect}\n
     time_starttransfer:  %{time_starttransfer}\n
     ----------\n
     time_total:  %{time_total}\n\n

     http_code: %{http_code}\n
     num_redirects: %{num_redirects}\n
     num_connects: %{num_connects}\n
     url_effective: %{url_effective}\n
     content_type: %{content_type}\n
     size_header %{size_header} B\n
     size_download: %{size_download} B\n
     speed_download: %{speed_download} B/s\n
     ssl_verify_result: %{ssl_verify_result}

\n
EOF
)
echo $curl_format | curl -k --location -o /dev/null -w @- -s $1 || echo -e "\nUSAGE: $0 http://example.com"


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
     time_total:  %{time_total}\n
     http_code: %{http_code}\n
     num_redirects: %{num_redirects}\n
     redirect_url: %{redirect_url}\n
\n
EOF
)
echo $curl_format | curl -o /dev/null -w @- -s $1 || echo -e "\nUSAGE: $0 http://example.com"

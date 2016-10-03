date=`date "+%Y-%m-%d"`
date_for_url=`date "+%Y/%m/%d"`
dow_url=http://geo.crox.net/djia/$date_for_url
dow=`curl -s $dow_url`

md5=`echo -n $date-$dow | md5 | tr 'a-z' 'A-Z'`

lon=`echo "ibase=16; .$(echo $md5 | cut -c -16)" | bc`
lat=`echo "ibase=16; .$(echo $md5 | cut -c 17-)" | bc`

url=http://maps.google.com/?ie=UTF8\&ll=42$lon,-71$lat\&z=8\&q=loc:42$lon,-71$lat

curl -X POST 'https://api.twilio.com/2010-04-01/Accounts/API_KEY/Messages.json' \
--data-urlencode 'To=YOUR_PHONE_NUMBER'  \
--data-urlencode 'From=TWILIO_PHONE_NUMBER'  \
--data-urlencode "Body=Geohash Coordinates: $url"  \
-u API_KEY:PASSWORD_KEY

# 40 -73 LI
# 42 -71 BOS


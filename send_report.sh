#! /bin/bash
#echo $PATH > /tmp/path.cron


DATE=$(date +"%Y_%m_%d_%M")
SRC_FILE='/절대경로/weekly_report.ipynb'
HTML_FILE=${SRC_FILE/ipynb/html}
REMOVE="rm PATH"
REMOVE=${REMOVE/PATH/$HTML_FILE}
eval $REMOVE
CONVERT='/home/ubuntu/.local/bin/jupyter nbconvert --execute --to html --TemplateExporter.exclude_input=True SRC'
CONVERT=${CONVERT/SRC/$SRC_FILE}
eval $CONVERT
export AWS_ACCESS_KEY_ID=블라블라
export AWS_SECRET_ACCESS_KEY=블라블라
export AWS_DEFAULT_REGION=블라블라
export AWS_DEFAULT_OUTPUT=json
S3_UPLOAD_KEY='경로/weekly_report_DDDD.html'
S3_UPLOAD_KEY=${S3_UPLOAD_KEY/DDDD/$DATE}
UPLOAD_TO_S3='aws s3api put-object --bucket 버킷이름 --key UPLOAD_KEY --body UPLOAD_TARGET_FILE --acl public-read --content-type text/html'
UPLOAD_TO_S3=${UPLOAD_TO_S3/UPLOAD_KEY/$S3_UPLOAD_KEY}
UPLOAD_TO_S3=${UPLOAD_TO_S3/UPLOAD_TARGET_FILE/$HTML_FILE}
$UPLOAD_TO_S3
SLACK_PAYLOAD='payload={"text":"주간보고서\n\nhttp://S3연결해둔도메인/UPLOAD_KEY","channel":"#general","link_names":1,"username":"weekly-report-bot","icon_emoji":":bar_chart:"}'
SLACK_PAYLOAD=${SLACK_PAYLOAD/UPLOAD_KEY/$S3_UPLOAD_KEY}
CURL="curl -X POST --data-urlencode 'PAYLOAD' 슬랙웹훅URL"
CURL=${CURL/PAYLOAD/$SLACK_PAYLOAD}
eval $CURL

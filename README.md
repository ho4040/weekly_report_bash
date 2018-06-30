# 개요

jupyter notebook 으로 만든 보고서를 HTML파일로 뽑아서 s3에 업로드 하고 slack 으로 알림


# 유의사항

#### 다음 문자열을 적당한 값으로 치환해야함.

* 절대경로 : ipynb 파일이 있는 절대경로
* 블라블라 : aws s3 관련정보
* 경로 : 업로드 할 s3 key 값
* 버킷이름 : s3 버킷명
* S3연결해둔도메인 : S3연결해둔도메인
* 슬랙웹훅URL : 슬랙웹훅URL

#### aws cli 필요

다음 페이지 확인 https://docs.aws.amazon.com/cli/latest/userguide/installing.html 


#### pandoc 설치 필요

```
$sudo apt-get install pandoc
```

또는 


```
$brew install pandoc
```


#### crontab 을 사용한 반복

crontab 사용시 환경변수인 PATH 값이 달라서 작동을 안할 수 있음. 

`send_report.sh` 두번째 줄의 `echo $PATH > /tmp/path.cron` 부분의 주석을 해제하면 실행시 PATH 값이 `/tmp/path.cron` 파일에 기록되므로 이 값을 crontab 설정에 반영해야함

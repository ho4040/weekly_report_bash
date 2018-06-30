# 개요

jupyter notebook 으로 만든 보고서를 HTML파일로 뽑아서 전송

# 유의사항


* aws cli 필요 https://docs.aws.amazon.com/cli/latest/userguide/installing.html

* pandoc 설치 필요

```
$sudo apt-get install pandoc
```

또는 


```
$brew install pandoc
```


* crontab 을 사용한 반복

crontab 사용시 환경변수인 PATH 값이 달라서 작동을 안할 수 있음. 

`send_report.sh` 두번째 줄의 `echo $PATH > /tmp/path.cron` 부분의 주석을 해제하면 실행시 PATH 값이 `/tmp/path.cron` 파일에 기록되므로 이 값을 crontab 설정에 반영해야함

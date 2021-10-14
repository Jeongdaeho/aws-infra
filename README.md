# 사전 준비 사항

## 참조 문서

https://github.com/awslabs/ecs-refarch-cloudformation#fork-destination-box

## aws cli 설치

https://docs.aws.amazon.com/ko_kr/cli/latest/userguide/cli-chap-install.html

## ssl 인증서 요청

```sh
aws acm request-certificate --domain-name "*.domain.com" --profile [profile]
```

## 알림 수신자 설정

```sh
# topic 생성
aws sns create-topic --name developers --profile [profile]

# subscribe 등록
aws sns subscribe --topic-arn [topic-arn] --protocol email --notification-endpoint [email] --profile [profile]
```

## master.yaml 파일 설정

1. master.yaml 파일을 ./masters/ 디렉토리로 복사및 이름 변경

2. \*\*\* 표기가 있는 부분을 설정

3. s3 디렉토리에 업로드 (선택사항)

4. infra 내부 파일 수정시 별도 디렉토리 생성후 업로드, master 파일 내부 경로도 수정.

## auto scaling 은 따로 설정해 준다.

변경 사항이나 예외 사항이 많기 때문에 자동화 하지 않았다.

## auto scaling 생성시 launch configration user data

ec2-user 권한으로 cd /home/ec2-user/aws-infra/;git pull 명령어 실행

```
#!/bin/bash

su - ec2-user -c "cd /home/ec2-user/aws-infra/;git pull"
```

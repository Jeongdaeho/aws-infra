## 사전 준비 사항

# 참조

https://github.com/awslabs/ecs-refarch-cloudformation#fork-destination-box

# aws cli 설치

https://docs.aws.amazon.com/ko_kr/cli/latest/userguide/cli-chap-install.html

# ssl 인증서 요청

```sh
aws acm request-certificate --domain-name "*.domain.com" --profile [profile]
```

# 알림 수신자 설정

```sh
# topic 생성
aws sns create-topic --name developers --profile [profile]

# subscribe 등록
aws sns subscribe --topic-arn [topic-arn] --protocol email --notification-endpoint [email] --profile [profile]
```

# s3 에 master 및, 필요 파일을 업로드 한다.

infra 내부 파일 수정시 master 파일의 경로도 수정해준다.

# auto scaling 은 따로 설정해 준다.

변경 사항이나 예외 사항이 많기 때문에 자동화 하지 않았다.

# launch configration user data

```
#!/bin/bash

git pull
```

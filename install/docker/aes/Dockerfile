FROM azul/zulu-openjdk-centos:11.0.7-11.39.15

RUN mkdir -p /eyeCloudAI/app/aes/lib

COPY ./lib /eyeCloudAI/app/aes/lib
COPY ./ape-aes-1.0.0.jar /eyeCloudAI/app/aes
COPY ./.libs /eyeCloudAI/app/aes
COPY ./run.sh /eyeCloudAI/app/aes

RUN chmod +x /eyeCloudAI/app/aes/run.sh
WORKDIR /eyeCloudAI/app/aes

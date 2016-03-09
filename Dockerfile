# Pull base image
FROM java:openjdk-7-jdk

# Install SDK requirements
RUN apt-get update
RUN apt-get -y install lib32stdc++6 lib32z1

# Install Android
RUN \
  wget http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz && \
  tar -xzvf android-sdk_r24.0.2-linux.tgz && \
  rm android-sdk_r24.0.2-linux.tgz && \
  mv android-sdk-linux /usr/local/android-sdk

# Install Android Tools
RUN \
  echo y | /usr/local/android-sdk/tools/android update sdk --filter platform-tools --no-ui --force -a && \
  echo y | /usr/local/android-sdk/tools/android update sdk --filter build-tools-21.1.2 --no-ui --force -a && \
  echo y | /usr/local/android-sdk/tools/android update sdk --filter build-tools-22.0.1 --no-ui --force -a && \
  echo y | /usr/local/android-sdk/tools/android update sdk --filter build-tools-23.0.2 --no-ui --force -a
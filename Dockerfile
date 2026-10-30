

FROM dart:stable

WORKDIR /app

COPY . .

RUN dart pub get --no-example

RUN dart compile exe bin/my_one_bot.dart -o bin/bot

CMD ["./bin/bot"]

FROM dart:stable AS build

WORKDIR /app
COPY pubspec.* ./
RUN dart pub get

COPY . .
RUN dart compile exe bin/my_one_bot.dart -o bin/bot

FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/bin/bot /app/bin/bot

CMD ["/app/bin/bot"]
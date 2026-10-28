FROM dart:stable AS build

# Ishchi papkani o'rnatamiz
WORKDIR /app

# Avval pubspec fayllarini ko'chirib o'tkazamiz
COPY pubspec.yaml pubspec.lock ./
RUN dart pub get

# Qolgan kodlarni ko'chiramiz
COPY . .
RUN dart pub get --offline
RUN dart compile exe bin/my_one_bot.dart -o bin/bot

# Ishga tushirish qismi
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/bin/bot /app/bin/bot

CMD ["/app/bin/bot"]
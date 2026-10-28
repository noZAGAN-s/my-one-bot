import 'package:televerse/televerse.dart';
void main() async {
  final bot = Bot('8885998193:AAHzaNxiY8aqiYYHaJ9eU9rOtkXGap-SedI');
  bot.command('start', (ctx) async {
    await ctx.reply('salom! Men ishlayapman');
  });
print('bot ishga tushdi...');
await bot.start();
}


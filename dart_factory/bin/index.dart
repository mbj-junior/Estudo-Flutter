import 'core.dart';

void main() {
   CreateCore core = CreateCore();

  try {
    core.start();
    core.stop();
  } catch (error) {
    print("[index] Uncaught error!");
    print(error);
  }
}

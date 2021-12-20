import 'database.dart';
import 'webserver.dart';

class CreateCore {
  Database database = Database();
  Webserver webserver = Webserver();

  void start() {
    print("> [core] Starting...");
    database.start();
    webserver.start();
    print("> [core] Starting done! System running!");
  }

  void stop() {
    print("> [core] Stopping...");
    webserver.stop();
    database.stop();
    print("> [core] Stopping done!");
  }
}

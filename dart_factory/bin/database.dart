class Database {
  void start() {
    print("> [database] Starting...");
    print("> [database] Connecting to Postgress...");
    print("> [database] Running migrations...");
    print("> [database] Starting done!");
  }

  void stop() {
    print("> [database] Stopping...");
    print("> [database] Clossing Postgress connection...");
    print("> [database] Running migrations...");
    print("> [database] Stopping done!");
  }
}

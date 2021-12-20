class Webserver {
  void start() {
    print("> [webserver] Starting...");
    print("> [webserver] Waiting for port to be available...");
    print("> [webserver] Starting done!");
  }

  void stop() {
    print("> [webserver] Stopping...");
    print("> [webserver] Gracefully waiting for all clients...");
    print("> [webserver] Closing all ports...");
    print("> [webserver] Stopping done!");
  }
}

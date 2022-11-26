class AuthException implements Exception {
  static const Map<String, String> errors = {
    "EMAIL_EXISTS": "E-mail já cadastrado",
    "OPERATION_NOT_ALLOWED": "Operação não permitida",
    "TOO_MANY_ATTEMPTS_TRY_LATER": "Acesso bloqueado no momento",
    "EMAIL_NOT_FOUND": "E-mail não encontrado",
    "INVALID_PASSWORD": "Senha invalida",
    "USER_DISABLED": "Conta desabilitada",
  };

  final String key;

  AuthException(this.key);

  @override
  String toString() {
    return errors[key] ?? "Ocorreu um erro";
  }
}

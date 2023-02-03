# Remote Authentication Use Case

> ## Caso de sucesso
1. ✅ Request com berto http válido (post)
2. ✅ Passar nos headers o content type Json
3. ✅ OK - 200 e resposta com dados
4. No content - 204 e resposta sem dados

> ## Error
1. Bad request - 400
2. Unauthorized - 401
3. Forbidden - 403
4. Not found - 404
5. Internal server error - 500

> ## Exceção - Status code diferente dos citados acima
1. Internal servcer error - 500

> ## Exceção - Http request deu alguma exceção
1. Internal servcer error - 500

> ## Exceção - Verbo http inválido
1. Internal servcer error - 500
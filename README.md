# Forno da Vila

Site demonstrativo de pizzaria, com vitrine para os clientes e uma página de administração separada.

## Arquivos

- `index.html`: site público com cardápio, carrinho e pedido pelo WhatsApp.
- `admin.html`: página separada para o responsável editar produtos, imagens, preços e dados da pizzaria. Não há link para ela na vitrine.
- `menu-data.js`: dados iniciais compartilhados pelas duas páginas.
- `setup.sql`: tabelas e regras para conectar um projeto Supabase.

## Abrir e publicar

As páginas usam JavaScript modules, então rode um servidor local. Com Node instalado, abra esta pasta no terminal e execute:

```powershell
npx serve .
```

Abra o endereço local exibido. No Vercel, importe o repositório, escolha esta pasta como Root Directory e use o preset `Other`. A página dos clientes fica na raiz; a administração fica no endereço `/admin.html`.

## Acesso de demonstração

Abra `/admin.html` e use:

- E-mail: `demo@fornodavila.com`
- Senha: `vila2026`

Sem Supabase, as edições ficam no armazenamento local do navegador. Servem para demonstrar o painel naquele dispositivo; não atualizam a loja de outros clientes. O número de teste já está configurado para `15991127852`, enviado ao WhatsApp no formato `5515991127852`.

## Conectar uma loja real

1. Crie um projeto Supabase e execute `setup.sql` no SQL Editor.
2. Em Authentication, crie o usuário do dono e desative o cadastro público.
3. No fim de `setup.sql`, descomente o `insert into public.store_settings`, coloque o UUID desse usuário e execute a instrução. Os produtos de exemplo são incluídos pelo restante do script.
4. Em `index.html` **e** `admin.html`, preencha `SUPABASE_URL` e `SUPABASE_ANON_KEY` no início do `<script type="module">`. Use apenas a chave publishable. Nunca coloque uma secret key ou `service_role` nessas páginas.
5. Publique novamente. O dono acessa `/admin.html` e entra com o usuário criado no Supabase. As mudanças salvas no banco e no Storage passam a aparecer para quem abre a vitrine.

As tabelas usam Row Level Security. A vitrine lê produtos ativos; a conta autenticada do responsável pode editar o cardápio. Deixe o cadastro público desligado e revise as políticas antes de usar com dados reais.

## Personalizar

- No administrador, edite nome da loja, telefone de pedidos, chamada principal e horários. Informe os horários em linhas separadas, por exemplo: `Sexta e sábado: 18h às 23h`.
- Cadastre pizzas na categoria **Pizzas clássicas** ou **Pizzas especiais**. Os detalhes escritos em “Ingredientes ou descrição” aparecem destacados nos cartões.
- Cadastre bebidas na categoria **Bebidas** e sobremesas em **Sobremesas**. Esses grupos têm seções próprias na vitrine.
- Escolha uma foto no administrador ou cole uma URL pública. No modo Supabase, a imagem enviada é guardada no bucket `menu-photos`.
- Troque a capa, as imagens de apresentação e as cores no CSS de `index.html`. Os produtos e a marca atuais são fictícios.

Font Awesome, Google Fonts e as fotos de demonstração carregam de CDNs externos. Troque as fotos de exemplo antes de publicar para uma pizzaria real.

## Pedidos

O carrinho abre o WhatsApp com nome, entrega ou retirada, itens, quantidades, preço por unidade, subtotal e total em blocos separados. A pizzaria confirma o pedido na conversa. O site não processa pagamento nem envia pedidos para um sistema de caixa.

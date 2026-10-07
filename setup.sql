-- Forno da Vila demo: Supabase schema and access policies.
-- Before running the seed section, create the owner's user in Supabase Auth.
-- Then replace OWNER_AUTH_USER_UUID below with that user's UUID.

create extension if not exists pgcrypto;

create table if not exists public.store_settings (
  id uuid primary key default gen_random_uuid(),
  owner_id uuid not null references auth.users(id) on delete cascade,
  name text not null default 'Forno da Vila',
  whatsapp text not null default '5515991127852',
  hours text not null default E'Terça a quinta: 18h às 22h\nSexta e sábado: 18h às 23h\nDomingo: 18h às 22h\nSegunda-feira: Fechado',
  hero text not null default 'A noite pede uma boa pizza.',
  created_at timestamptz not null default now()
);

create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  category text not null default 'Clássicas',
  price numeric(10,2) not null check (price >= 0),
  description text not null default '',
  image_url text not null default '',
  badge text not null default '',
  active boolean not null default true,
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

alter table public.store_settings enable row level security;
alter table public.products enable row level security;

grant select on public.store_settings to anon, authenticated;
grant insert, update on public.store_settings to authenticated;
grant select on public.products to anon, authenticated;
grant insert, update, delete on public.products to authenticated;

drop policy if exists "Public can read store settings" on public.store_settings;
create policy "Public can read store settings"
  on public.store_settings for select to anon, authenticated using (true);

drop policy if exists "Owner can insert store settings" on public.store_settings;
create policy "Owner can insert store settings"
  on public.store_settings for insert to authenticated with check (auth.uid() = owner_id);

drop policy if exists "Owner can update store settings" on public.store_settings;
create policy "Owner can update store settings"
  on public.store_settings for update to authenticated using (auth.uid() = owner_id) with check (auth.uid() = owner_id);

drop policy if exists "Public can read active products" on public.products;
create policy "Public can read active products"
  on public.products for select to anon using (active = true);

drop policy if exists "Owner can read all products" on public.products;
create policy "Owner can read all products"
  on public.products for select to authenticated using (
    exists (select 1 from public.store_settings s where s.owner_id = auth.uid())
  );

drop policy if exists "Owner can insert products" on public.products;
create policy "Owner can insert products"
  on public.products for insert to authenticated with check (
    exists (select 1 from public.store_settings s where s.owner_id = auth.uid())
  );

drop policy if exists "Owner can update products" on public.products;
create policy "Owner can update products"
  on public.products for update to authenticated using (
    exists (select 1 from public.store_settings s where s.owner_id = auth.uid())
  ) with check (
    exists (select 1 from public.store_settings s where s.owner_id = auth.uid())
  );

drop policy if exists "Owner can delete products" on public.products;
create policy "Owner can delete products"
  on public.products for delete to authenticated using (
    exists (select 1 from public.store_settings s where s.owner_id = auth.uid())
  );

-- Public bucket for menu pictures. Only an authenticated store owner can upload.
insert into storage.buckets (id, name, public)
values ('menu-photos', 'menu-photos', true)
on conflict (id) do update set public = true;

drop policy if exists "Public can view menu photos" on storage.objects;
create policy "Public can view menu photos"
  on storage.objects for select to anon, authenticated using (bucket_id = 'menu-photos');

drop policy if exists "Store owner can upload menu photos" on storage.objects;
create policy "Store owner can upload menu photos"
  on storage.objects for insert to authenticated with check (
    bucket_id = 'menu-photos' and exists (
      select 1 from public.store_settings s where s.owner_id = auth.uid()
    )
  );

-- Add the store row for the owner. Replace the UUID first, then run this statement.
-- insert into public.store_settings (owner_id, name, whatsapp, hours, hero)
-- values ('OWNER_AUTH_USER_UUID', 'Forno da Vila', '5515991127852', E'Terça a quinta: 18h às 22h\nSexta e sábado: 18h às 23h\nDomingo: 18h às 22h\nSegunda-feira: Fechado', 'A noite pede uma boa pizza.');

-- Starter menu. Run once to create the example products in the live database.
insert into public.products (name, category, price, description, image_url, badge, active, sort_order) values
('Margherita', 'Pizzas clássicas', 49.90, 'Molho de tomate da casa, muçarela, tomate fresco e manjericão.', 'https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&fit=crop&w=900&q=82', 'Queridinha', true, 1),
('Calabresa da Vila', 'Pizzas clássicas', 52.90, 'Calabresa artesanal fatiada, cebola roxa, muçarela e orégano.', 'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?auto=format&fit=crop&w=900&q=82', 'Mais pedida', true, 2),
('Portuguesa', 'Pizzas clássicas', 56.90, 'Presunto, muçarela, ovo, cebola, ervilha e azeitona verde.', 'https://images.unsplash.com/photo-1593560708920-61dd98c46a4e?auto=format&fit=crop&w=900&q=82', '', true, 3),
('Frango com Catupiry', 'Pizzas clássicas', 57.90, 'Frango desfiado temperado, Catupiry original, muçarela e milho.', 'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=900&q=82', '', true, 4),
('Napolitana', 'Pizzas clássicas', 53.90, 'Muçarela, tomate em rodelas, parmesão, alho e manjericão.', 'https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&fit=crop&w=900&q=82', '', true, 5),
('Quatro queijos', 'Pizzas especiais', 59.90, 'Muçarela, gorgonzola, parmesão e requeijão cremoso.', 'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=900&q=82', '', true, 6),
('Pepperoni', 'Pizzas especiais', 61.90, 'Pepperoni levemente picante, muçarela e molho de tomate.', 'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?auto=format&fit=crop&w=900&q=82', '', true, 7),
('Bosque de cogumelos', 'Pizzas especiais', 62.90, 'Shimeji, cogumelo paris, alho assado, muçarela e salsinha.', 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?auto=format&fit=crop&w=900&q=82', 'Vegetariana', true, 8),
('Brócolis com bacon', 'Pizzas especiais', 59.90, 'Brócolis fresco, bacon crocante, alho dourado e muçarela.', 'https://images.unsplash.com/photo-1593560708920-61dd98c46a4e?auto=format&fit=crop&w=900&q=82', '', true, 9),
('Palmito e alho-poró', 'Pizzas especiais', 61.90, 'Palmito macio, alho-poró, muçarela e toque de pimenta-do-reino.', 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?auto=format&fit=crop&w=900&q=82', 'Vegetariana', true, 10),
('Coca-Cola 2 L', 'Bebidas', 15.90, 'Garrafa de 2 litros, servida bem gelada.', 'https://images.unsplash.com/photo-1629203851122-3726ecdf080e?auto=format&fit=crop&w=900&q=82', '2 litros', true, 11),
('Guaraná Antarctica 2 L', 'Bebidas', 13.90, 'Garrafa de 2 litros, servida bem gelada.', 'https://images.unsplash.com/photo-1629203851122-3726ecdf080e?auto=format&fit=crop&w=900&q=82', '2 litros', true, 12),
('Coca-Cola lata', 'Bebidas', 6.50, 'Lata de 350 ml.', 'https://images.unsplash.com/photo-1554866585-cd94860890b7?auto=format&fit=crop&w=900&q=82', '350 ml', true, 13),
('Guaraná Antarctica lata', 'Bebidas', 6.00, 'Lata de 350 ml.', 'https://images.unsplash.com/photo-1554866585-cd94860890b7?auto=format&fit=crop&w=900&q=82', '350 ml', true, 14),
('Suco de laranja', 'Bebidas', 9.90, 'Suco de laranja integral, garrafa de 500 ml.', 'https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&w=900&q=82', '500 ml', true, 15),
('Água mineral', 'Bebidas', 4.00, 'Garrafa de 500 ml. Consulte as opções com ou sem gás.', 'https://images.unsplash.com/photo-1559839914-17aae19cec71?auto=format&fit=crop&w=900&q=82', '500 ml', true, 16),
('Brownie da casa', 'Sobremesas', 14.90, 'Brownie de chocolate com calda e uma bola de sorvete.', 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?auto=format&fit=crop&w=900&q=82', '', true, 17),
('Pizza de chocolate', 'Sobremesas', 49.90, 'Chocolate cremoso, morangos frescos e leite condensado.', 'https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&fit=crop&w=900&q=82', 'Pra dividir', true, 18),
('Petit gâteau', 'Sobremesas', 19.90, 'Bolinho quente de chocolate com centro cremoso e sorvete.', 'https://images.unsplash.com/photo-1624353365286-3f8d62daad51?auto=format&fit=crop&w=900&q=82', '', true, 19),
('Combo da casa', 'Combos', 79.90, 'Pizza grande, bebida de 1,5 L e sobremesa do dia.', 'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?auto=format&fit=crop&w=900&q=82', 'Boa pra dividir', true, 20);

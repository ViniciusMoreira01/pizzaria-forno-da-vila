export const STORE_KEY = 'forno-da-vila-demo-v4';
export const DEMO_EMAIL = 'demo@fornodavila.com';
export const DEMO_PASSWORD = 'vila2026';

export const defaultData = {
  settings: {
    name: 'Forno da Vila',
    whatsapp: '5515991127852',
    hours: 'Terça a quinta: 18h às 22h\nSexta e sábado: 18h às 23h\nDomingo: 18h às 22h\nSegunda-feira: Fechado',
    hero: 'A noite pede uma boa pizza.'
  },
  products: [
    {id:'margherita',name:'Margherita',category:'Pizzas clássicas',price:49.9,description:'Molho de tomate da casa, muçarela, tomate fresco e manjericão.',image:'https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&fit=crop&w=900&q=82',badge:'Queridinha',active:true},
    {id:'calabresa',name:'Calabresa da Vila',category:'Pizzas clássicas',price:52.9,description:'Calabresa fatiada, cebola, muçarela e orégano.',image:'https://img0.didiglobal.com/static/soda_public/img_085f987310b11b13b0944b2222405eb6.png',badge:'Mais pedida',active:true},
    {id:'portuguesa',name:'Portuguesa',category:'Pizzas clássicas',price:56.9,description:'Presunto, muçarela, ovo, cebola, ervilha e azeitona verde.',image:'https://img0.didiglobal.com/static/soda_public/img_2ae3d32f5d33aeea9b0382259bdb240e.jpg',badge:'',active:true},
    {id:'frango-catupiry',name:'Frango com Catupiry',category:'Pizzas clássicas',price:57.9,description:'Frango desfiado, milho, muçarela e Catupiry cremoso.',image:'https://popmenucloud.com/cdn-cgi/image/width%3D1200%2Cheight%3D1200%2Cfit%3Dscale-down%2Cformat%3Dauto%2Cquality%3D60/wqomyxzu/31a16414-4d9f-4e82-bd37-6e21f04d0c3c.jpg',badge:'',active:true},
    {id:'napolitana',name:'Napolitana',category:'Pizzas clássicas',price:53.9,description:'Molho de tomate, muçarela, tomate fresco, parmesão e manjericão.',image:'https://static.wixstatic.com/media/daa43f_88ddaa518b8d4247b2c542836240740e~mv2.jpg',badge:'',active:true},
    {id:'quatro-queijos',name:'Quatro queijos',category:'Pizzas especiais',price:59.9,description:'Muçarela, gorgonzola, parmesão e requeijão cremoso.',image:'https://images.aws.nestle.recipes/original/b3dc9fd22801cadc1ceb190b71e8a0b0_pizza-4-queijos-2-receitas-nestle.jpg',badge:'',active:true},
    {id:'pepperoni',name:'Pepperoni',category:'Pizzas especiais',price:61.9,description:'Pepperoni, muçarela e molho de tomate.',image:'https://tofuu.getjusto.com/orioneat-local/resized2/co4AMpLoz9tgrA74C-1080-x.webp',badge:'',active:true},
    {id:'bosque',name:'Bosque de cogumelos',category:'Pizzas especiais',price:62.9,description:'Shimeji, cogumelo paris, alho assado, muçarela e salsinha.',image:'https://tblg.k-img.com/restaurant/images/Rvw/312864/640x640_rect_d7bfaf28470dacc3951999058d7f553b.jpg',badge:'Vegetariana',active:true},
    {id:'bacon-brocolis',name:'Brócolis com bacon',category:'Pizzas especiais',price:59.9,description:'Brócolis, bacon crocante, muçarela e alho.',image:'https://img0.didiglobal.com/static/soda_public/img_44df821fcdcfcec39714f28f2e396c89.png',badge:'',active:true},
    {id:'palmito',name:'Palmito e alho-poró',category:'Pizzas especiais',price:61.9,description:'Palmito, alho-poró e muçarela, com um toque de pimenta-do-reino.',image:'https://d135llbe2j366l.cloudfront.net/compressed/pizza-brasileira-de-palmito-e-alho-poro-google.webp',badge:'Vegetariana',active:true},
    {id:'coca-2l',name:'Coca-Cola 2 L',category:'Bebidas',price:15.9,description:'Garrafa de 2 litros, servida bem gelada.',image:'https://anossadrogaria.vteximg.com.br/arquivos/ids/510833-1000-1000/970429_00.jpg?v=637044914010500000',badge:'2 litros',active:true},
    {id:'guarana-2l',name:'Guaraná Antarctica 2 L',category:'Bebidas',price:13.9,description:'Refrigerante de guaraná em garrafa de 2 litros, servido gelado.',image:'https://tdc08h.vteximg.com.br/arquivos/ids/263816-1000-1000/Refrigerante-Guarana-Antarctica-Pet-2l-Trad.jpg?v=638416194153070000',badge:'2 litros',active:true},
    {id:'pepsi-2l',name:'Pepsi 2 L',category:'Bebidas',price:14.9,description:'Refrigerante Pepsi em garrafa de 2 litros, servido gelado.',image:'https://www.arenaatacado.com.br/on/demandware.static/-/Sites-storefront-catalog-sv/default/dwe2c639e3/Produtos/3184-7892840800246-refrigerante%20pepsi%20pet%202l-pepsi-1.jpg',badge:'2 litros',active:true},
    {id:'coca-lata',name:'Coca-Cola lata',category:'Bebidas',price:6.5,description:'Lata de 350 ml.',image:'https://nivelepoc.vtexassets.com/arquivos/ids/295816-800-1067?aspect=true&height=1067&v=638796952769000000&width=800',badge:'350 ml',active:true},
    {id:'guarana-lata',name:'Guaraná Antarctica lata',category:'Bebidas',price:6.0,description:'Lata de Guaraná Antarctica com 350 ml.',image:'https://choppbrahmaexpress.vtexassets.com/arquivos/ids/158480/2f1a8384be47da2c12d08fd6bae7c689.png?v=638854247184600000',badge:'350 ml',active:true},
    {id:'suco-laranja',name:'Suco de laranja',category:'Bebidas',price:9.9,description:'Suco de laranja integral, garrafa de 500 ml.',image:'https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&w=900&q=82',badge:'500 ml',active:true},
    {id:'agua',name:'Água mineral',category:'Bebidas',price:4.0,description:'Garrafa de 500 ml. Consulte as opções com ou sem gás.',image:'https://images.unsplash.com/photo-1559839914-17aae19cec71?auto=format&fit=crop&w=900&q=82',badge:'500 ml',active:true},
    {id:'brownie',name:'Brownie da casa',category:'Sobremesas',price:14.9,description:'Brownie de chocolate com calda e uma bola de sorvete.',image:'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?auto=format&fit=crop&w=900&q=82',badge:'',active:true},
    {id:'pizza-chocolate',name:'Pizza de chocolate',category:'Sobremesas',price:49.9,description:'Chocolate cremoso, morangos frescos e leite condensado.',image:'https://images.unsplash.com/photo-1579751626657-72bc17010498?auto=format&fit=crop&w=900&q=82',badge:'Pra dividir',active:true},
    {id:'petit-gateau',name:'Petit gâteau',category:'Sobremesas',price:19.9,description:'Bolinho quente de chocolate com centro cremoso e sorvete.',image:'https://images.unsplash.com/photo-1624353365286-3f8d62daad51?auto=format&fit=crop&w=900&q=82',badge:'',active:true},
    {id:'combo-casa',name:'Combo da casa',category:'Combos',price:79.9,description:'Pizza grande, bebida de 1,5 L e sobremesa do dia.',image:'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?auto=format&fit=crop&w=900&q=82',badge:'Boa pra dividir',active:true}
  ]
};



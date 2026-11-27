import React, { useMemo, useState } from 'react';
import { createRoot } from 'react-dom/client';
import { Search, ShoppingBag, ArrowRight, BookOpen, Heart, Menu, X, SlidersHorizontal } from 'lucide-react';
import './styles.css';

const books = [
  { id: 1, title: 'Atomic Habits', author: 'James Clear', category: 'Self Growth', price: 499, oldPrice: 599, rating: 4.8, color: 'sage', cover: 'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&w=600&q=85', note: 'Small changes, remarkable results' },
  { id: 2, title: 'The Midnight Library', author: 'Matt Haig', category: 'Fiction', price: 399, rating: 4.7, color: 'blue', cover: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&w=600&q=85', note: 'A story about infinite possibilities' },
  { id: 3, title: 'Ikigai', author: 'Héctor García & Francesc Miralles', category: 'Self Growth', price: 349, rating: 4.6, color: 'rose', cover: 'https://images.unsplash.com/photo-1519682337058-a94d519337bc?auto=format&fit=crop&w=600&q=85', note: 'The Japanese secret to a long life' },
  { id: 4, title: 'The Psychology of Money', author: 'Morgan Housel', category: 'Money', price: 449, rating: 4.9, color: 'amber', cover: 'https://images.unsplash.com/photo-1532012197267-da84d127e765?auto=format&fit=crop&w=600&q=85', note: 'Timeless lessons on wealth & greed' },
  { id: 5, title: 'Before the Coffee Gets Cold', author: 'Toshikazu Kawaguchi', category: 'Fiction', price: 379, rating: 4.5, color: 'cream', cover: 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=600&q=85', note: 'A café where time travel is possible' },
  { id: 6, title: 'Deep Work', author: 'Cal Newport', category: 'Productivity', price: 499, rating: 4.7, color: 'dark', cover: 'https://images.unsplash.com/photo-1544716278-ca5e3f4endung?auto=format&fit=crop&w=600&q=85', note: 'Rules for focused success' },
  { id: 7, title: 'Educated', author: 'Tara Westover', category: 'Memoir', price: 429, rating: 4.6, color: 'green', cover: 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?auto=format&fit=crop&w=600&q=85', note: 'A memoir of learning and identity' },
  { id: 8, title: 'The Alchemist', author: 'Paulo Coelho', category: 'Fiction', price: 299, rating: 4.7, color: 'gold', cover: 'https://images.unsplash.com/photo-1476275466078-4007374efbbe?auto=format&fit=crop&w=600&q=85', note: 'A journey toward your own legend' }
];

const categories = ['All books', 'Fiction', 'Self Growth', 'Money', 'Productivity', 'Memoir'];

function App() {
  const [search, setSearch] = useState('');
  const [category, setCategory] = useState('All books');
  const [cart, setCart] = useState([]);
  const [wishlist, setWishlist] = useState([]);
  const [mobileMenu, setMobileMenu] = useState(false);
  const [cartOpen, setCartOpen] = useState(false);

  const visibleBooks = useMemo(() => books.filter(book => {
    const matchesSearch = (book.title + ' ' + book.author).toLowerCase().includes(search.toLowerCase());
    const matchesCategory = category === 'All books' || book.category === category;
    return matchesSearch && matchesCategory;
  }), [search, category]);

  const cartCount = cart.reduce((sum, item) => sum + item.qty, 0);
  const cartTotal = cart.reduce((sum, item) => sum + item.price * item.qty, 0);

  function addToCart(book) {
    setCart(prev => {
      const existing = prev.find(item => item.id === book.id);
      return existing ? prev.map(item => item.id === book.id ? { ...item, qty: item.qty + 1 } : item) : [...prev, { ...book, qty: 1 }];
    });
    setCartOpen(true);
  }

  function changeQty(id, delta) {
    setCart(prev => prev.map(item => item.id === id ? { ...item, qty: item.qty + delta } : item).filter(item => item.qty > 0));
  }

  function toggleWish(id) {
    setWishlist(prev => prev.includes(id) ? prev.filter(item => item !== id) : [...prev, id]);
  }

  return (
    <div className="app-shell">
      <div className="announcement">A little magic for your bookshelf · Free shipping on orders over ₹999</div>
      <header className="topbar">
        <button className="mobile-toggle icon-btn" onClick={() => setMobileMenu(!mobileMenu)} aria-label="Toggle menu">{mobileMenu ? <X size={20}/> : <Menu size={20}/>}</button>
        <a className="brand" href="#"><span className="brand-mark"><BookOpen size={19}/></span><span>book<span className="brand-light">nest</span></span></a>
        <nav className={mobileMenu ? 'nav-links open' : 'nav-links'}>
          <a href="#books" onClick={() => setMobileMenu(false)}>Browse books</a>
          <a href="#story" onClick={() => setMobileMenu(false)}>Our story</a>
          <a href="#footer" onClick={() => setMobileMenu(false)}>Contact</a>
        </nav>
        <div className="top-actions">
          <button className="icon-btn" aria-label="Wishlist" onClick={() => document.getElementById('books').scrollIntoView({behavior:'smooth'})}><Heart size={19}/></button>
          <button className="cart-button" onClick={() => setCartOpen(!cartOpen)} aria-label="Open cart"><ShoppingBag size={18}/><span>Bag</span><b>{cartCount}</b></button>
        </div>
      </header>

      <main>
        <section className="hero">
          <div className="hero-copy">
            <span className="eyebrow"><span className="eyebrow-dot"/> YOUR NEXT CHAPTER STARTS HERE</span>
            <h1>Books that make<br/><em>room for wonder.</em></h1>
            <p>For curious minds, quiet moments, and stories that stay with you long after the last page.</p>
            <a className="primary-cta" href="#books">Find your next read <ArrowRight size={17}/></a>
            <div className="hero-proof"><div className="proof-avatars"><span>R</span><span>A</span><span>M</span></div><span>Loved by readers who love getting lost.</span></div>
          </div>
          <div className="hero-art">
            <div className="hero-orbit orbit-one"/><div className="hero-orbit orbit-two"/>
            <div className="hero-note">slow down<br/>and read</div>
            <div className="hero-stack stack-back"><span>the art of</span><strong>being</strong></div>
            <div className="hero-stack stack-middle"><span>somewhere</span><strong>in between</strong></div>
            <div className="hero-stack stack-front"><span>BOOKNEST</span><strong>little<br/>joys</strong><small>a collection of stories</small></div>
            <div className="spark spark-a">✳</div><div className="spark spark-b">✦</div>
          </div>
        </section>

        <section className="value-strip">
          <div><span className="value-icon">✳</span><span>Thoughtfully curated</span></div><div><span className="value-icon">↗</span><span>Little discoveries daily</span></div><div><span className="value-icon">♡</span><span>Made for book lovers</span></div>
        </section>

        <section className="catalogue" id="books">
          <div className="section-heading">
            <div><span className="eyebrow">THE BOOKSHELF</span><h2>Find your kind of <em>story.</em></h2></div>
            <span className="book-count">{visibleBooks.length} BOOKS TO EXPLORE</span>
          </div>
          <div className="catalogue-tools">
            <div className="search-box"><Search size={18}/><input value={search} onChange={e => setSearch(e.target.value)} placeholder="Search by title or author..." aria-label="Search books"/></div>
            <div className="category-row"><SlidersHorizontal size={15}/>{categories.map(cat => <button key={cat} className={category === cat ? 'category active' : 'category'} onClick={() => setCategory(cat)}>{cat}</button>)}</div>
          </div>
          {visibleBooks.length ? <div className="book-grid">{visibleBooks.map(book => <article className="book-card" key={book.id}>
            <div className={'book-cover ' + book.color}><img src={book.cover} alt={book.title} loading="lazy"/><span className="cover-badge">{book.category}</span><button className={wishlist.includes(book.id) ? 'wish active' : 'wish'} onClick={() => toggleWish(book.id)} aria-label="Add to wishlist"><Heart size={17} fill={wishlist.includes(book.id) ? 'currentColor' : 'none'}/></button></div>
            <div className="book-info"><div className="book-meta"><span>{book.category}</span><span className="rating">★ {book.rating}</span></div><h3>{book.title}</h3><p className="author">{book.author}</p><p className="book-note">{book.note}</p><div className="book-bottom"><strong>₹{book.price}</strong><button className="add-btn" onClick={() => addToCart(book)}>Add to bag <span>+</span></button></div></div>
          </article>)}</div> : <div className="empty-state"><BookOpen size={28}/><h3>No books found</h3><p>Try another title, author, or category.</p><button onClick={() => {setSearch('');setCategory('All books')}}>Clear filters</button></div>}
        </section>

        <section className="story-banner" id="story"><div className="story-decoration">“</div><div><span className="eyebrow">A NOTE FROM BOOKNEST</span><h2>There’s a book for every<br/><em>version of you.</em></h2><p>Some days you need a new idea. Some days, an escape. We’re here to help you find the pages that meet you where you are.</p></div><a href="#books" className="story-link">Meet your next favourite <ArrowRight size={16}/></a></section>
      </main>

      <footer id="footer"><a className="brand footer-brand" href="#"><span className="brand-mark"><BookOpen size={18}/></span><span>book<span className="brand-light">nest</span></span></a><span>Made for the love of reading.</span><span>© 2026 BookNest · Demo store</span></footer>

      {cartOpen && <div className="cart-overlay" onClick={() => setCartOpen(false)}><aside className="cart-drawer" onClick={e => e.stopPropagation()}><div className="cart-head"><div><span className="eyebrow">YOUR LITTLE BOOK HAUL</span><h2>Your bag ({cartCount})</h2></div><button className="icon-btn" onClick={() => setCartOpen(false)}><X size={20}/></button></div>
        {cart.length ? <><div className="cart-items">{cart.map(item => <div className="cart-item" key={item.id}><img src={item.cover} alt={item.title}/><div className="cart-item-info"><strong>{item.title}</strong><small>{item.author}</small><span>₹{item.price}</span><div className="qty-control"><button onClick={() => changeQty(item.id,-1)}>−</button><span>{item.qty}</span><button onClick={() => changeQty(item.id,1)}>+</button></div></div></div>)}</div><div className="cart-summary"><div><span>Subtotal</span><strong>₹{cartTotal.toLocaleString('en-IN')}</strong></div><small>Shipping and taxes calculated at checkout.</small><button className="checkout-btn" onClick={() => alert('Demo checkout: backend and payments will be added in a later milestone.')}>Continue to checkout <ArrowRight size={17}/></button></div></> : <div className="cart-empty"><ShoppingBag size={30}/><h3>Your bag is taking a nap.</h3><p>Add a book to wake it up.</p><button onClick={() => setCartOpen(false)}>Explore books</button></div>}
      </aside></div>}
    </div>
  );
}

createRoot(document.getElementById('root')).render(<App />);

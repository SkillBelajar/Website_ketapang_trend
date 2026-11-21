<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
    <meta charset="<?php bloginfo('charset'); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>
<?php wp_body_open(); ?>

<!-- 1. TOP BAR NETWORK -->
<div class="top-bar">
    <div class="container">
        <div class="network-links">
            <a href="<?php echo esc_url(home_url('/')); ?>" class="active">detikKetapang</a>
            <a href="#pawannews">PawanNews</a>
            <a href="#kalbarterkini">KalbarTerkini</a>
            <a href="#sawittrend">SawitTrend</a>
            <a href="#suaradaerah">SuaraDaerah</a>
            <a href="#foto">Foto</a>
        </div>
        <div class="top-right-meta">
            <span class="top-date"><?php echo detik_date_indo(); ?></span>
            <span class="top-auth">
                <?php if (is_user_logged_in()) : ?>
                    <a href="<?php echo esc_url(admin_url()); ?>" class="auth-btn">
                        <span class="detik-id-badge">ID</span> Panel Redaksi
                    </a>
                <?php else : ?>
                    <a href="<?php echo esc_url(wp_login_url()); ?>" class="auth-btn">
                        <span class="detik-id-badge">detikID</span> Masuk
                    </a>
                <?php endif; ?>
            </span>
        </div>
    </div>
</div>

<!-- 2. MAIN BRAND HEADER -->
<header class="main-header">
    <div class="container">
        <div class="header-row">
            <div class="brand-box">
                <a href="<?php echo esc_url(home_url('/')); ?>" class="brand-logo">
                    detik<span class="dot">.</span><span class="tag">Ketapang</span>
                </a>
                <span class="brand-tagline">Portal Berita Terkini Kalbar</span>
            </div>
            
            <div class="header-search">
                <form role="search" method="get" class="search-form" action="<?php echo esc_url(home_url('/')); ?>">
                    <input type="search" class="search-input" placeholder="Cari berita, peristiwa, tokoh..." value="<?php echo get_search_query(); ?>" name="s" required />
                    <button type="submit" class="search-submit">CARI</button>
                </form>
            </div>
        </div>
    </div>
</header>

<!-- 3. NAVIGATION RIBBON -->
<nav class="nav-ribbon">
    <div class="container">
        <div class="nav-wrapper">
            <div class="kanal-menu-btn">
                <span>☰</span> <strong>KANAL</strong>
            </div>
            <ul class="main-nav">
                <li class="<?php echo is_front_page() ? 'current-menu-item' : ''; ?>">
                    <a href="<?php echo esc_url(home_url('/')); ?>">HOME</a>
                </li>
                <?php
                $categories = get_categories(array('orderby' => 'name', 'order' => 'ASC', 'hide_empty' => false));
                foreach ($categories as $cat) {
                    if ($cat->slug === 'uncategorized') continue;
                    $active = is_category($cat->term_id) ? 'current-menu-item' : '';
                    $clean_name = strtoupper(html_entity_decode($cat->name, ENT_QUOTES, 'UTF-8'));
                    echo '<li class="' . esc_attr($active) . '"><a href="' . esc_url(get_category_link($cat->term_id)) . '">' . esc_html($clean_name) . '</a></li>';
                }
                ?>
            </ul>
        </div>
    </div>
</nav>

<!-- 4. BREAKING NEWS TICKER -->
<div class="ticker-section">
    <div class="container">
        <div class="ticker-wrap">
            <div class="ticker-label">
                <span class="pulse-dot"></span>
                <span>TERKINI</span>
            </div>
            <div class="ticker-content">
                <?php
                $latest_post = get_posts(array('numberposts' => 1));
                if (!empty($latest_post)) {
                    $lp = $latest_post[0];
                    echo '<a href="' . esc_url(get_permalink($lp->ID)) . '">' . esc_html($lp->post_title) . '</a>';
                } else {
                    echo '<span>Selamat datang di portal berita terkini Kabupaten Ketapang dan Kalimantan Barat.</span>';
                }
                ?>
            </div>
            <div class="ticker-controls">
                <span class="ticker-btn">‹</span>
                <span class="ticker-btn">›</span>
            </div>
        </div>
    </div>
</div>

<!-- 5. TRENDING TOPICS PILL BAR -->
<div class="trending-bar">
    <div class="container">
        <div class="trending-wrap">
            <span class="trending-label">🔥 TRENDING:</span>
            <a href="<?php echo esc_url(home_url('/?s=Jembatan+Pawan')); ?>" class="trending-tag">#JembatanPawan</a>
            <a href="<?php echo esc_url(home_url('/?s=Harga+Sawit')); ?>" class="trending-tag">#HargaSawitKalbar</a>
            <a href="<?php echo esc_url(home_url('/?s=Bupati+Ketapang')); ?>" class="trending-tag">#BupatiKetapang</a>
            <a href="<?php echo esc_url(home_url('/?s=Delta+Pawan')); ?>" class="trending-tag">#DeltaPawan</a>
            <a href="<?php echo esc_url(home_url('/?s=Polres+Ketapang')); ?>" class="trending-tag">#PolresKetapang</a>
            <a href="<?php echo esc_url(home_url('/?s=Keraton+Matan')); ?>" class="trending-tag">#KeratonMatan</a>
        </div>
    </div>
</div>

<!-- 6. TOP LEADERBOARD BILLBOARD (DETIK STYLE) -->
<div class="container top-billboard-container">
    <div class="ad-notice">ADVERTISEMENT</div>
    <div class="top-billboard-slot">
        <div class="billboard-left">
            <span class="billboard-sponsor">IKLAN LAYANAN MASYARAKAT • PEMKAB KETAPANG</span>
            <strong class="billboard-title">SUKSESKAN TRANSFORMASI DIGITAL & KETAPANG MAJU</strong>
            <span class="billboard-desc">Pantau Informasi Resmi Pembangunan Daerah dan Layanan Publik 24 Jam</span>
        </div>
        <div class="billboard-right">
            <a href="#layanan" class="billboard-cta">KUNJUNGI PORTAL &rsaquo;</a>
        </div>
    </div>
</div>


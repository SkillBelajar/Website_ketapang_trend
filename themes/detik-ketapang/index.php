<?php
/**
 * Main Index / Homepage Template
 */
get_header(); ?>

<main class="container">
    <div class="home-layout">
        <!-- LEFT COLUMN: EDITORIAL SPOTLIGHT & FEED (65%) -->
        <div class="main-content-col">
            
            <?php
            // Query for Hero Spotlight (1 post)
            $spotlight_query = new WP_Query(array(
                'posts_per_page' => 1,
                'ignore_sticky_posts' => 1,
            ));

            $spotlight_id = 0;
            if ($spotlight_query->have_posts()) :
                while ($spotlight_query->have_posts()) : $spotlight_query->the_post();
                    $spotlight_id = get_the_ID();
                    $categories = get_the_category();
                    $raw_cat = !empty($categories) ? $categories[0]->name : 'Berita Utama';
                    $cat_name = html_entity_decode($raw_cat, ENT_QUOTES, 'UTF-8');
            ?>
                <!-- 1. HEADLINE SPOTLIGHT -->
                <article class="headline-spotlight">
                    <div class="spotlight-media">
                        <span class="spotlight-badge">🔴 BERITA UTAMA</span>
                        <a href="<?php the_permalink(); ?>">
                            <?php if (has_post_thumbnail()) : ?>
                                <?php the_post_thumbnail('detik-hero'); ?>
                            <?php else : ?>
                                <img src="https://images.unsplash.com/photo-1585829365295-ab7cd400c167?w=800&auto=format&fit=crop&q=80" alt="<?php the_title_attribute(); ?>">
                            <?php endif; ?>
                        </a>
                    </div>
                    <div class="spotlight-content">
                        <div class="spotlight-meta">
                            <span class="spotlight-cat"><?php echo esc_html(strtoupper($cat_name)); ?></span>
                            <span>•</span>
                            <span><?php echo detik_time_ago(); ?></span>
                        </div>
                        <h1 class="spotlight-title">
                            <a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
                        </h1>
                        <div class="spotlight-excerpt">
                            <?php the_excerpt(); ?>
                        </div>
                        <div class="byline">
                            Liputan Khusus: <strong>Tim Redaksi detikKetapang</strong>
                        </div>
                    </div>
                </article>
            <?php
                endwhile;
                wp_reset_postdata();
            endif;
            ?>

            <!-- 2. SUB-HEADLINES (3 COLS) -->
            <?php
            $sub_query = new WP_Query(array(
                'posts_per_page' => 3,
                'post__not_in'   => array($spotlight_id),
                'ignore_sticky_posts' => 1,
            ));

            $excluded_ids = array($spotlight_id);

            if ($sub_query->have_posts()) :
            ?>
                <div class="sub-headlines-grid">
                    <?php
                    while ($sub_query->have_posts()) : $sub_query->the_post();
                        $excluded_ids[] = get_the_ID();
                        $cats = get_the_category();
                        $raw_cat = !empty($cats) ? $cats[0]->name : 'Sorotan';
                        $cat_name = html_entity_decode($raw_cat, ENT_QUOTES, 'UTF-8');
                    ?>
                        <article class="sub-card">
                            <div class="sub-card-media">
                                <a href="<?php the_permalink(); ?>">
                                    <?php if (has_post_thumbnail()) : ?>
                                        <?php the_post_thumbnail('detik-sub'); ?>
                                    <?php else : ?>
                                        <img src="https://images.unsplash.com/photo-1504711434969-e33886168f5c?w=400&auto=format&fit=crop&q=80" alt="<?php the_title_attribute(); ?>">
                                    <?php endif; ?>
                                </a>
                            </div>
                            <div class="sub-card-body">
                                <span class="sub-card-cat"><?php echo esc_html(strtoupper($cat_name)); ?></span>
                                <h2 class="sub-card-title">
                                    <a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
                                </h2>
                                <span class="sub-card-time"><?php echo detik_time_ago(); ?></span>
                            </div>
                        </article>
                    <?php endwhile; wp_reset_postdata(); ?>
                </div>
            <?php endif; ?>

            <!-- 4. KILAS BERITA TERKINI (FEED STREAM) -->
            <div class="section-header">
                <h3 class="section-title">Kilas Berita Terkini</h3>
                <span style="font-size: 12px; color: #64748b; font-weight: 600;">Update Setiap Menit</span>
            </div>

            <div class="news-feed">
                <?php
                $feed_query = new WP_Query(array(
                    'posts_per_page' => 8,
                    'post__not_in'   => $excluded_ids,
                    'ignore_sticky_posts' => 1,
                ));

                if ($feed_query->have_posts()) :
                    while ($feed_query->have_posts()) : $feed_query->the_post();
                        $cats = get_the_category();
                        $raw_cat = !empty($cats) ? $cats[0]->name : 'Daerah';
                        $cat_name = html_entity_decode($raw_cat, ENT_QUOTES, 'UTF-8');
                ?>
                    <article class="feed-item">
                        <div class="feed-thumb">
                            <a href="<?php the_permalink(); ?>">
                                <?php if (has_post_thumbnail()) : ?>
                                    <?php the_post_thumbnail('detik-thumb'); ?>
                                <?php else : ?>
                                    <img src="https://images.unsplash.com/photo-1495020689067-958852a7765e?w=300&auto=format&fit=crop&q=80" alt="<?php the_title_attribute(); ?>">
                                <?php endif; ?>
                            </a>
                        </div>
                        <div class="feed-content">
                            <span class="feed-cat"><?php echo esc_html(strtoupper($cat_name)); ?></span>
                            <h2 class="feed-title">
                                <a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
                            </h2>
                            <div class="feed-excerpt">
                                <?php the_excerpt(); ?>
                            </div>
                            <div class="feed-meta">
                                <span>Ketapang</span> • <span><?php echo detik_time_ago(); ?></span>
                            </div>
                        </div>
                    </article>
                <?php
                    endwhile;
                    wp_reset_postdata();
                else :
                    echo '<p style="color: #64748b;">Belum ada berita tambahan di kanal ini.</p>';
                endif;
                ?>
            </div>

        </div>

        <!-- RIGHT COLUMN: SIDEBAR TERPOPULER & WIDGET (35%) -->
        <aside class="sidebar-col">
            
            <!-- TERPOPULER DETIK STYLE -->
            <div class="sidebar-box">
                <div class="section-header" style="border-bottom-color: var(--detik-orange);">
                    <h3 class="section-title" style="color: var(--detik-orange);">Terpopuler</h3>
                    <span style="font-size: 11px; color: #94a3b8; font-weight: 700;">24 JAM TERAKHIR</span>
                </div>
                
                <div class="popular-list">
                    <?php
                    $pop_query = new WP_Query(array(
                        'posts_per_page' => 5,
                        'meta_key'       => 'post_views_count',
                        'orderby'        => 'meta_value_num',
                        'order'          => 'DESC',
                        'ignore_sticky_posts' => 1,
                    ));

                    if (!$pop_query->have_posts()) {
                        $pop_query = new WP_Query(array(
                            'posts_per_page' => 5,
                            'ignore_sticky_posts' => 1,
                        ));
                    }

                    $rank = 1;
                    if ($pop_query->have_posts()) :
                        while ($pop_query->have_posts()) : $pop_query->the_post();
                            $cats = get_the_category();
                            $raw_cat = !empty($cats) ? $cats[0]->name : 'Trending';
                            $cat_name = html_entity_decode($raw_cat, ENT_QUOTES, 'UTF-8');
                    ?>
                        <article class="popular-item">
                            <span class="popular-num"><?php echo $rank; ?></span>
                            <div class="popular-content">
                                <div class="popular-cat"><?php echo esc_html(strtoupper($cat_name)); ?></div>
                                <h4 class="popular-title">
                                    <a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
                                </h4>
                                <span class="popular-time"><?php echo detik_time_ago(); ?></span>
                            </div>
                        </article>
                    <?php
                            $rank++;
                        endwhile;
                        wp_reset_postdata();
                    endif;
                    ?>
                </div>

                <div class="popular-more">
                    <a href="<?php echo esc_url(home_url('/?s=terpopuler')); ?>">Lihat Semua Terpopuler &rsaquo;</a>
                </div>
            </div>

            <!-- KOMODITAS & PASAR KETAPANG (DETIKFINANCE STYLE) -->
            <div class="sidebar-box">
                <div class="section-header">
                    <h3 class="section-title" style="font-size: 15px;">Pasar & Komoditas Kalbar</h3>
                </div>
                <div class="commodity-box">
                    <div class="commodity-row">
                        <span class="commodity-name">TBS Sawit (10-20 Thn)</span>
                        <span class="commodity-price price-up">Rp 3.140/kg ▲</span>
                    </div>
                    <div class="commodity-row">
                        <span class="commodity-name">Minyak Kelapa Sawit (CPO)</span>
                        <span class="commodity-price price-up">Rp 13.850/kg ▲</span>
                    </div>
                    <div class="commodity-row">
                        <span class="commodity-name">Karet Kering (SIR 20)</span>
                        <span class="commodity-price price-down">Rp 23.200/kg ▼</span>
                    </div>
                    <div class="commodity-row">
                        <span class="commodity-name">Beras Premium Ketapang</span>
                        <span class="commodity-price price-flat">Rp 16.500/kg ▬</span>
                    </div>
                    <div class="commodity-row">
                        <span class="commodity-name">Bauksit Olahan (Wash Bauxite)</span>
                        <span class="commodity-price price-up">US$ 54.2/MT ▲</span>
                    </div>
                </div>
                <div style="font-size: 10px; color: #94a3b8; margin-top: 8px; text-align: right;">
                    Sumber: Dinas Perkebunan & Perdagangan Kalbar
                </div>
            </div>

            <!-- LAYANAN PENGADUAN / SALURAN HAK JAWAB -->
            <div class="sidebar-box" style="background: #f8fafc; border-left: 4px solid var(--detik-blue);">
                <h4 style="font-size: 13px; font-weight: 800; color: var(--detik-blue); margin-bottom: 6px; text-transform: uppercase;">
                    📢 Saluran Pengaduan Warga
                </h4>
                <p style="font-size: 12px; color: #475569; margin-bottom: 12px; line-height: 1.5;">
                    Punya informasi peristiwa, keluhan fasilitas umum, atau koreksi pemberitaan? Kirim langsung ke ruang redaksi detikKetapang.
                </p>
                <a href="https://wa.me/6281234567890?text=Halo%20Redaksi%20detikKetapang" target="_blank" style="display: block; text-align: center; background: var(--detik-blue); color: #ffffff; padding: 8px 12px; border-radius: 4px; font-size: 12px; font-weight: 700;">
                    Hubungi Redaksi via WhatsApp
                </a>
            </div>

        </aside>
    </div>
</main>

<?php get_footer(); ?>

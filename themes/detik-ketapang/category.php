<?php
/**
 * Category Archive Template
 */
get_header(); ?>

<main class="container">
    <div style="margin-top: 16px; margin-bottom: 12px; font-size: 12px; color: #64748b;">
        <a href="<?php echo esc_url(home_url('/')); ?>">Home</a> &rsaquo; <span>Kategori: <?php single_cat_title(); ?></span>
    </div>

    <div class="section-header" style="border-bottom-width: 3px;">
        <h1 class="section-title" style="font-size: 22px;">
            Kanal: <?php single_cat_title(); ?>
        </h1>
    </div>

    <div class="home-layout" style="margin-top: 16px;">
        <div class="main-content-col">
            <div class="news-feed">
                <?php if (have_posts()) : while (have_posts()) : the_post(); ?>
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
                            <span class="feed-cat"><?php single_cat_title(); ?></span>
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
                <?php endwhile; else : ?>
                    <p style="padding: 24px; background: #ffffff; border: 1px solid var(--detik-border); border-radius: 4px;">
                        Belum ada berita di kategori ini.
                    </p>
                <?php endif; ?>
            </div>
            
            <div style="margin-top: 24px;">
                <?php the_posts_pagination(array(
                    'mid_size'  => 2,
                    'prev_text' => __('&laquo; Sebelumnya', 'detik-ketapang'),
                    'next_text' => __('Selanjutnya &raquo;', 'detik-ketapang'),
                )); ?>
            </div>
        </div>

        <aside class="sidebar-col">
            <div class="sidebar-box">
                <div class="section-header" style="border-bottom-color: var(--detik-orange);">
                    <h3 class="section-title" style="color: var(--detik-orange); font-size: 16px;">Terpopuler</h3>
                </div>
                <div class="popular-list">
                    <?php
                    $pop_query = new WP_Query(array('posts_per_page' => 5));
                    $rank = 1;
                    if ($pop_query->have_posts()) :
                        while ($pop_query->have_posts()) : $pop_query->the_post();
                    ?>
                        <article class="popular-item">
                            <span class="popular-num"><?php echo $rank; ?></span>
                            <div class="popular-content">
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
            </div>
        </aside>
    </div>
</main>

<?php get_footer(); ?>

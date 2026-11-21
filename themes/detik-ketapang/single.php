<?php
/**
 * Single Post Template
 */
get_header(); ?>

<main class="container">
    <div class="home-layout">
        <div class="main-content-col">
            <?php while (have_posts()) : the_post(); 
                $categories = get_the_category();
                $cat_name = !empty($categories) ? $categories[0]->name : 'Berita';
                $cat_link = !empty($categories) ? get_category_link($categories[0]->term_id) : home_url('/');
            ?>
                <article class="article-container" style="margin-top: 0; padding: 24px;">
                    <!-- BREADCRUMB -->
                    <div class="article-breadcrumb">
                        <a href="<?php echo esc_url(home_url('/')); ?>">Home</a> &rsaquo; 
                        <a href="<?php echo esc_url($cat_link); ?>"><?php echo esc_html($cat_name); ?></a> &rsaquo; 
                        <span>Detail Berita</span>
                    </div>

                    <header class="article-header">
                        <a href="<?php echo esc_url($cat_link); ?>" class="article-category-badge">
                            <?php echo esc_html($cat_name); ?>
                        </a>
                        <h1 class="article-title"><?php the_title(); ?></h1>
                        
                        <div class="article-meta">
                            <div class="author-info">
                                <span class="author-name">Liputan: Tim Redaksi detikKetapang</span>
                                <span>•</span>
                                <span><?php the_time('l, d F Y | H:i'); ?> WIB</span>
                            </div>
                            
                            <div class="share-bar">
                                <a href="https://api.whatsapp.com/send?text=<?php echo urlencode(get_the_title() . ' - ' . get_permalink()); ?>" target="_blank" class="share-btn share-wa">WhatsApp</a>
                                <a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo urlencode(get_permalink()); ?>" target="_blank" class="share-btn share-fb">Facebook</a>
                                <a href="https://twitter.com/intent/tweet?url=<?php echo urlencode(get_permalink()); ?>&text=<?php echo urlencode(get_the_title()); ?>" target="_blank" class="share-btn share-x">X</a>
                            </div>
                        </div>
                    </header>

                    <?php if (has_post_thumbnail()) : ?>
                        <div class="article-featured-image">
                            <?php the_post_thumbnail('large'); ?>
                            <div class="image-caption">
                                Foto: Dokumentasi Tim Redaksi detikKetapang / Media Siber
                            </div>
                        </div>
                    <?php endif; ?>

                    <!-- ARTICLE BODY -->
                    <div class="article-body">
                        <?php the_content(); ?>
                    </div>

                    <!-- BACA JUGA WIDGET -->
                    <?php
                    $related = get_posts(array(
                        'category__in' => wp_get_post_categories(get_the_ID()),
                        'numberposts'  => 1,
                        'post__not_in' => array(get_the_ID())
                    ));
                    if (!empty($related)) :
                    ?>
                        <div class="baca-juga-box">
                            Simak Juga: <a href="<?php echo esc_url(get_permalink($related[0]->ID)); ?>"><?php echo esc_html($related[0]->post_title); ?></a>
                        </div>
                    <?php endif; ?>

                    <!-- PEDOMAN HAK JAWAB & DEWAN PERS -->
                    <div style="background: #f1f5f9; border: 1px solid #cbd5e1; border-radius: 4px; padding: 14px; margin-top: 30px; font-size: 12px; color: #475569;">
                        <strong>Pedoman Pemberitaan Media Siber:</strong> Redaksi detikKetapang taat pada Kode Etik Jurnalistik dan UU Pers No. 40/1999. Pihak yang merasa dirugikan atas muatan berita berhak menggunakan hak jawab dan koreksi melalui kontak redaksi.
                    </div>

                </article>
            <?php endwhile; ?>
        </div>

        <!-- SIDEBAR -->
        <aside class="sidebar-col">
            <div class="sidebar-box">
                <div class="section-header" style="border-bottom-color: var(--detik-orange);">
                    <h3 class="section-title" style="color: var(--detik-orange); font-size: 16px;">Berita Terpopuler</h3>
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
                        $pop_query = new WP_Query(array('posts_per_page' => 5));
                    }
                    $rank = 1;
                    if ($pop_query->have_posts()) :
                        while ($pop_query->have_posts()) : $pop_query->the_post();
                            $cats = get_the_category();
                            $cat_name = !empty($cats) ? $cats[0]->name : 'Trending';
                    ?>
                        <article class="popular-item">
                            <span class="popular-num"><?php echo $rank; ?></span>
                            <div class="popular-content">
                                <div class="popular-cat"><?php echo esc_html($cat_name); ?></div>
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

<?php
/**
 * detikKetapang Theme Functions
 */

if (!defined('ABSPATH')) {
    exit;
}

function detik_setup() {
    add_theme_support('title-tag');
    add_theme_support('post-thumbnails');
    add_theme_support('html5', array('search-form', 'comment-form', 'comment-list', 'gallery', 'caption'));
    
    register_nav_menus(array(
        'primary' => __('Menu Utama Kanal', 'detik-ketapang'),
    ));

    add_image_size('detik-hero', 800, 450, true);
    add_image_size('detik-sub', 400, 250, true);
    add_image_size('detik-thumb', 240, 150, true);
}
add_action('after_setup_theme', 'detik_setup');

function detik_scripts() {
    wp_enqueue_style('detik-fonts', 'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap', array(), null);
    wp_enqueue_style('detik-style', get_stylesheet_uri(), array('detik-fonts'), '1.1.0');
}
add_action('wp_enqueue_scripts', 'detik_scripts');

// Custom Excerpt Length
function detik_custom_excerpt_length($length) {
    return 18;
}
add_filter('excerpt_length', 'detik_custom_excerpt_length');

function detik_excerpt_more($more) {
    return '...';
}
add_filter('excerpt_more', 'detik_excerpt_more');

// Post View Tracking
function detik_set_post_views($postID) {
    $count_key = 'post_views_count';
    $count = get_post_meta($postID, $count_key, true);
    if ($count == '') {
        $count = 0;
        delete_post_meta($postID, $count_key);
        add_post_meta($postID, $count_key, '1');
    } else {
        $count++;
        update_post_meta($postID, $count_key, $count);
    }
}

function detik_get_post_views($postID) {
    $count_key = 'post_views_count';
    $count = get_post_meta($postID, $count_key, true);
    if ($count == '') {
        return '0';
    }
    return number_format_i18n((int)$count);
}

// Track view on single post
function detik_track_post_views($post_id) {
    if (!is_single()) return;
    if (empty($post_id)) {
        global $post;
        $post_id = $post->ID;
    }
    detik_set_post_views($post_id);
}
add_action('wp_head', 'detik_track_post_views');

// Pure Indonesian time ago
function detik_time_ago() {
    $diff = current_time('timestamp') - get_the_time('U');
    if ($diff < 60) {
        return 'baru saja';
    } elseif ($diff < 3600) {
        $min = floor($diff / 60);
        return $min . ' menit lalu';
    } elseif ($diff < 86400) {
        $hours = floor($diff / 3600);
        return $hours . ' jam lalu';
    } elseif ($diff < 604800) {
        $days = floor($diff / 86400);
        return $days . ' hari lalu';
    } else {
        return get_the_time('d M Y');
    }
}

function detik_date_indo() {
    $hari = array('Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu');
    $bulan = array('', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember');
    
    // Timezone WIB (UTC+7)
    $tz = new DateTimeZone('Asia/Jakarta');
    $dt = new DateTime('now', $tz);
    
    $n_hari = (int)$dt->format('w');
    $tgl = $dt->format('j');
    $n_bulan = (int)$dt->format('n');
    $thn = $dt->format('Y');
    
    return $hari[$n_hari] . ', ' . $tgl . ' ' . $bulan[$n_bulan] . ' ' . $thn . ' WIB';
}

#!/bin/bash

# WordPressのインストール
#=======================
wp core install \
--url="https://wordpress.test" \
--title="Dev Wordpress" \
--admin_user='admin' \
--admin_password='123456' \
--admin_email='info@wordpress.test' \
--allow-root

# 一般設定
# =======================
# キャッチフレーズを空にする
wp option update blogdescription --allow-root ''
# 日本語
wp language core install --allow-root --activate ja
# タイムゾーンと日時表記
wp option update --allow-root timezone_string 'Asia/Tokyo'
wp option update --allow-root date_format 'Y-m-d'
wp option update --allow-root time_format 'H:i'

# パーマリンク設定
# =======================
wp option update permalink_structure --allow-root /%year%/%                                                                                                              %/%day%/%postname%/

# 外観
# =======================
wp theme delete --allow-root twentytwentyonce
wp theme delete --allow-root twentytwentytwo

# プラグイン
# =======================
wp plugin delete --allow-root hello.php
wp plugin delete --allow-root akismet

# 固定ページ
# =======================
wp post create --allow-root --post_type=page --post_title='About'

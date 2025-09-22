#!/bin/bash

zip -r /backup/xfusioncorp_blog.zip /var/www/html/blog
scp /backup/xfusioncorp_blog.zip  clint@stbkp01:/backup/
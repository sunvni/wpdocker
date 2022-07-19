#!/bin/bash
a2enmod ssl
a2ensite default-ssl
service apache2 restart
service apache2 stop

#!/bin/sh
java -jar selenium-server-standalone-2.47.1.jar -port 4445 -Dwebdriver.chrome.driver=`pwd`/chromedriver

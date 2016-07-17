#!/bin/bash
cd /tmp
wget -O root.zip https://codeload.github.com/lamubake/test/zip/master
unzip root && rm root.zip
cd test-master
zip -r -m ROOT.war *
cp ROOT.war ${OPENSHIFT_DEPENDENCIES_DIR}jbossews/webapps/ROOT.war
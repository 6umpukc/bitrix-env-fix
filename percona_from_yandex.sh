#!/usr/bin/bash
#
echo "Install wget"
dnf install -y wget > /dev/null 2>&1
#
echo "Add gpg keys"
wget https://ftp.yandex.ru/mirrors/percona/yum/PERCONA-PACKAGING-KEY -O /etc/pki/rpm-gpg/PERCONA-PACKAGING-KEY > /dev/null 2>&1
wget https://ftp.yandex.ru/mirrors/percona/yum/RPM-GPG-KEY-Percona -O  /etc/pki/rpm-gpg/RPM-GPG-KEY-Percona > /dev/null 2>&1
#
echo "Pseudo install percona-release package"
wget https://ftp.yandex.ru/mirrors/percona/yum/percona-release-latest.noarch.rpm -O /tmp/percona-release-latest.noarch.rpm > /dev/null 2>&1
rpm -Uvh --nodeps --noscripts /tmp/percona-release-latest.noarch.rpm > /dev/null 2>&1
rm -f /tmp/percona-release-latest.noarch.rpm > /dev/null 2>&1
#
echo "Add percona repofiles mirrored to Yandex"
cat > /etc/yum.repos.d/percona-prel-release.repo << EOF
#
# This repo is managed by "percona-release" utility, do not edit!
#
[prel-release-noarch]
name = Percona Release release/noarch YUM repository
# baseurl = http://repo.percona.com/prel/yum/release/\$releasever/RPMS/noarch
baseurl = https://ftp.yandex.ru/mirrors/percona/prel/yum/release/\$releasever/RPMS/noarch
enabled = 1
gpgcheck = 1
gpgkey = file:///etc/pki/rpm-gpg/PERCONA-PACKAGING-KEY
EOF
#
cat > /etc/yum.repos.d/percona-ps-80-release.repo << EOF
#
# This repo is managed by "percona-release" utility, do not edit!
#
[ps-80-release-x86_64]
name = Percona Server for MySQL 8.0 release/x86_64 YUM repository
#baseurl = http://repo.percona.com/ps-80/yum/release/\$releasever/RPMS/x86_64
baseurl = https://ftp.yandex.ru/mirrors/percona/ps-80/yum/release/\$releasever/RPMS/x86_64
enabled = 1
gpgcheck = 1
gpgkey = file:///etc/pki/rpm-gpg/PERCONA-PACKAGING-KEY

[ps-80-release-sources]
name = Percona Server for MySQL 8.0 release/sources YUM repository
#baseurl = http://repo.percona.com/ps-80/yum/release/\$releasever/SRPMS
baseurl = https://ftp.yandex.ru/mirrors/percona/ps-80/yum/release/\$releasever/SRPMS
enabled = 0
gpgcheck = 1
gpgkey = file:///etc/pki/rpm-gpg/PERCONA-PACKAGING-KEY
EOF
#
cat > /etc/yum.repos.d/percona-telemetry-release.repo << EOF
#
# This repo is managed by "percona-release" utility, do not edit!
#
[telemetry-release-x86_64]
name = Percona Telemetry release/x86_64 YUM repository
#baseurl = http://repo.percona.com/telemetry/yum/release/\$releasever/RPMS/x86_64
baseurl = https://ftp.yandex.ru/mirrors/percona/telemetry/yum/release/\$releasever/RPMS/x86_64
enabled = 1
gpgcheck = 1
gpgkey = file:///etc/pki/rpm-gpg/PERCONA-PACKAGING-KEY

[telemetry-release-sources]
name = Percona Telemetry release/sources YUM repository
#baseurl = http://repo.percona.com/telemetry/yum/release/\$releasever/SRPMS
baseurl = https://ftp.yandex.ru/mirrors/percona/telemetry/yum/release/\$releasever/SRPMS
enabled = 0
gpgcheck = 1
gpgkey = file:///etc/pki/rpm-gpg/PERCONA-PACKAGING-KEY
EOF
#
cat > /etc/yum.repos.d/percona-tools-release.repo << EOF
#
# This repo is managed by "percona-release" utility, do not edit!
#
[tools-release-x86_64]
name = Percona Tools release/x86_64 YUM repository
#baseurl = http://repo.percona.com/tools/yum/release/\$releasever/RPMS/x86_64
baseurl = https://ftp.yandex.ru/mirrors/percona/tools/yum/release/\$releasever/RPMS/x86_64
enabled = 1
gpgcheck = 1
gpgkey = file:///etc/pki/rpm-gpg/PERCONA-PACKAGING-KEY

[tools-release-sources]
name = Percona Tools release/sources YUM repository
#baseurl = http://repo.percona.com/tools/yum/release/\$releasever/SRPMS
baseurl = https://ftp.yandex.ru/mirrors/percona/tools/yum/release/\$releasever/SRPMS
enabled = 0
gpgcheck = 1
gpgkey = file:///etc/pki/rpm-gpg/PERCONA-PACKAGING-KEY
EOF
#
echo "Clear cache"
dnf clean all > /dev/null 2>&1
echo "All done!"
#

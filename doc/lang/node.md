### Install Latest Nodejs on CentOS/RHEL 7

steps:

(1) Add Node.js Yum Repository
(2) Install Node.js

**For Latest Release:**

```shell
curl -sL install-node.now.sh | sh
```

or

```shell
yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_13.x | sudo -E bash -
```

**For Stable Release:**

```shell
yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_12.x | sudo -E bash -
```


**Installation**

```shell
sudo yum install nodejs
```
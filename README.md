# choria_aaasvc

[![Build Status](https://travis-ci.com/ExalDraen/puppet-choria_aaasvc.svg?branch=master)](https://travis-ci.com/ExalDraen/puppet-choria_aaasvc)

Installs and configure the Choria centralised AAA service

#### Table of Contents

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->

- [choria_aaasvc](#choriaaaasvc)
    - [Description](#description)
    - [Setup](#setup)
        - [What choria_aaasvc affects](#what-choriaaaasvc-affects)
        - [Setup Requirements](#setup-requirements)
        - [Beginning with choria_aaasvc](#beginning-with-choriaaaasvc)
    - [Usage](#usage)
        - [Configure MCO client to use AAA svc](#configure-mco-client-to-use-aaa-svc)
        - [Configure AAA service to use a static list of users](#configure-aaa-service-to-use-a-static-list-of-users)
    - [Limitations](#limitations)
    - [Development](#development)

<!-- markdown-toc end -->

## Description

This module installs the [Choria centralised AAA service](https://github.com/choria-io/aaasvc), part of the [choria
orchestration system](https://choria.io).

This service provides an alternative to the traditional certificate based
AAA system provided in Choria and allows you to e.g. use your organization's
SSO system to authenticate users.

For more background see the [choria blog](https://choria.io/blog/post/2019/01/23/central_aaa/) on this topic.


## Setup

### What choria_aaasvc affects

* The `aaasvc` package and it's configuration
* Files in the `mcollective` libdir.

### Setup Requirements

You will need:

* An up-to-date choria deployment (choria >= 0.13.1)
* Three sets of certificates for use by aaasvc, as described in the [aaasvc documentation](https://github.com/choria-io/aaasvc#general-configuration)

### Beginning with choria_aaasvc

1. Add the `choria_aaasvc` and `choria` (from [choria/choria](https://forge.puppet.com/choria/choria)) classes to a host
2. Provision the certificates on the host - this is currently not handled by the module and must be done out of band.
3. Run puppet on the host
4. Verify the `aaasvc` installation using the [method described in the docs](https://github.com/choria-io/aaasvc#testing-login)

*Note*: the host you install `choria_aaasvc` on must be able to access the [choria release repo](https://packagecloud.io/choria/release) or another repo that has the `aaasvc` package.

## Usage

### Configure MCO client to use AAA svc

* Add the `choria_aaasvc::client` class
* Configure the MCO client to use the AAA service
```conf
plugin.choria.security.request_signer.url = http://localhost:8080/choria/v1/sign
plugin.choria.security.request_signer.token_environment = CHORIA_TOKEN
plugin.choria.security.request_signer.force = 1
```

### Configure AAA service to use a static list of users

To configure the AAA service to use a static list of users, we need to configure it to use the `userlist` authenticator and configure the list of users.

To configure the userlist authenticator, ensure that the `authenticator` parameter is set to `userlist` (this is the default):
```yaml
choria_aaasvc::config:
  authenticator: userlist
```

To configure the list of users, set the `choria_aaasvc::user_config` parameter. For example:
```
choria_aaasvc::user_config:
- username: puppetadmin
  password: "$2y$05$c4b/0WZ5WJ3nhSZPN9m8keCUPlCYtNOTkqU4fDNEPCUy1C9Pfqn2e"
  acls:
  - puppet.*
- username: admin
  password: "....."
  opa_policy_file: "/etc/choria/signer/common.rego"
```
For details on the syntax and contents of the user list file, see [the aaasvc docs](https://github.com/choria-io/aaasvc#static-configuration)

## Limitations

Only tested on CentOS 7, but should work on any RedHat derivative.

## Development

See `CONTRIBUTING.md`.

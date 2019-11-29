# choria_aaasvc

Installs and configure the Choria centralised AAA service

#### Table of Contents

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->

- [choria_aaasvc](#choriaaaasvc)
    - [-](#-)
    - [Description](#description)
    - [Setup](#setup)
        - [What choria_aaasvc affects](#what-choriaaaasvc-affects)
        - [Setup Requirements](#setup-requirements)
        - [Beginning with choria_aaasvc](#beginning-with-choriaaaasvc)
    - [Usage](#usage)
        - [Configure MCO client to use AAA svc](#configure-mco-client-to-use-aaa-svc)
    - [Reference](#reference)
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

To configure

### Beginning with choria_aaasvc

TBD

## Usage

### Configure MCO client to use AAA svc

* Add the `choria_aaasvc::client` class
* Configure the MCO client to use the AAA service
```conf
plugin.choria.security.request_signer.url = http://localhost:8080/choria/v1/sign
plugin.choria.security.request_signer.token_environment = CHORIA_TOKEN
plugin.choria.security.request_signer.force = 1
```

## Reference

This section is deprecated. Instead, add reference information to your code as Puppet Strings comments, and then use Strings to generate a REFERENCE.md in your module. For details on how to add code comments and generate documentation with Strings, see the Puppet Strings [documentation](https://puppet.com/docs/puppet/latest/puppet_strings.html) and [style guide](https://puppet.com/docs/puppet/latest/puppet_strings_style.html)

If you aren't ready to use Strings yet, manually create a REFERENCE.md in the root of your module directory and list out each of your module's classes, defined types, facts, functions, Puppet tasks, task plans, and resource types and providers, along with the parameters for each.

For each element (class, defined type, function, and so on), list:

  * The data type, if applicable.
  * A description of what the element does.
  * Valid values, if the data type doesn't make it obvious.
  * Default value, if any.

For example:

```
### `pet::cat`

#### Parameters

##### `meow`

Enables vocalization in your cat. Valid options: 'string'.

Default: 'medium-loud'.
```

## Limitations

Only tested on CentOS 7, but should work on any RedHat derivative.

## Development

See `CONTRIBUTING.md`.

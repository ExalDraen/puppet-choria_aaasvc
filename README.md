# choria_aaasvc

Installs and configure the Choria centralised AAA service

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with choria_aaasvc](#setup)
    * [What choria_aaasvc affects](#what-choria_aaasvc-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with choria_aaasvc](#beginning-with-choria_aaasvc)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

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
* Warnings or other important notices.

### Setup Requirements

TBD.


### Beginning with choria_aaasvc

The very basic steps needed for a user to get the module up and running. This can include setup steps, if necessary, or it can be an example of the most basic use of the module.

## Usage

Include usage examples for common use cases in the **Usage** section. Show your users how to use your module to solve problems, and be sure to include code examples. Include three to five examples of the most important or common tasks a user can accomplish with your module. Show users how to accomplish more complex tasks that involve different types, classes, and functions working in tandem.

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

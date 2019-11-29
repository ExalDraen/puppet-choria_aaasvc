# Reference
<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

**Classes**

* [`choria_aaasvc`](#choria_aaasvc): Installs, configures and manages the Choria AAA system
* [`choria_aaasvc::client`](#choria_aaasvcclient): Configure an MCO client to interact with the Choria AAA svc
* [`choria_aaasvc::config`](#choria_aaasvcconfig): Configures the Choria Server
* [`choria_aaasvc::install`](#choria_aaasvcinstall): Installs the `choria-aaasvc` package
* [`choria_aaasvc::service`](#choria_aaasvcservice): Manages the `aaasvc` service

## Classes

### choria_aaasvc

Installs, configures and manages the Choria AAA system

#### Examples

##### 

```puppet
include choria_aaasvc
```

#### Parameters

The following parameters are available in the `choria_aaasvc` class.

##### `config_file`

Data type: `Stdlib::Compat::Absolute_path`

The main choria AAA configuration file

##### `choria_config_file`

Data type: `Stdlib::Compat::Absolute_path`

The AAA svc choria config file

##### `config`

Data type: `Hash`

The configuration for AAA svc

##### `choria_config`

Data type: `Hash`

The choria side configuration for AAA svc

##### `ensure`

Data type: `Enum['present', 'absent']`

Add or remove the software

##### `package_name`

Data type: `String`

The package to install

##### `service_name`

Data type: `String`

Name of the choria AAA service

##### `version`

Data type: `String`

The version of Choria AAA to install

### choria_aaasvc::client

Configure an MCO client to interact with the Choria AAA svc

#### Examples

##### 

```puppet
include choria_aaasvc::client
```

### choria_aaasvc::config

Configures the Choria Server

### choria_aaasvc::install

Installs the `choria-aaasvc` package

### choria_aaasvc::service

Manages the `aaasvc` service

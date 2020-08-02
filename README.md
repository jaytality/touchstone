# Touchstone

> ### **Touchstone**
> ###### touch·​stone | \ ˈtəch-ˌstōn
>
> _A fundamental or quintessential part or feature._
>
> <sub>[Merriam-Webster Definition #1](https://www.merriam-webster.com/dictionary/touchstone)</sub>
>

This project serves as a template project which interacts with [Keystone](https://github.com/jaytwitch/keystone) - through
which websites, applications and more can be hosted via a rapidly deployable/destructible set of docker environments.

## Requirements

* Docker must be installed on the server
* Bash script must be supported
* [Keystone](https://github.com/jaytwitch/keystone) containers should be deployed and running

## Configuration

- STILL WRITING

## Usage

A touchstone deployment is designed to be entirely self-contained on a 1 touchstone deployment per website/project basis.

* Place your site/project/application code inside the `/code` folder - this is the same as placing something within `/var/www/html`

### Deploying to...

#### Local Development (ENV = Dev)

* Run `dev.sh` to start the container -- it'll create a `projectname_dev` container

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

* Copy `docker/.env.sample` to `docker/.env` and edit the .env file to your tastes
* Configurations are split into 3 deployment channels - DEV, STG, PRD
    * DEV - your development area, you (and your devs) use this locally to check your own work and changes
    * STG - your staging area, stakeholders/clients use this environment to check and confirm work
    * PRD - your production area, this is the live all-systems-go environment

| setting | description |
| ------- | ----------- |
| DEV/STG/PRD **_URL** | the URL that the container will respond to |
| DEV/STG/PRD **_NET** | the docker network the container will reside in |
| DEV/STG/PRD **_SSL** | the email address SSL certificates will be registered with Let's Encrypt with |

## Usage

A touchstone deployment is designed to be entirely self-contained on a 1 touchstone deployment per website/project basis.

* Clone the **touchstone** project, you can rename the folder to whatever you like (name it to the site URL e.g. mywebsite.tld, for example);
* Run `init.sh` which will delete the .git related files so that there's no clashes between touchstone and your site code repo
* Place your site/project/application code inside the `/code` folder - this is the same as placing something within `/var/www/html`
* Copy `docker/.env.sample` to `docker/.env` and edit the .env file to your tastes - info described above
* You're now ready to deploy (the whole folder!)

### Deploying to...

#### Local Development (ENV = DEV)

* Run `dev.sh` to start the container -- it'll create a `projectname_dev` container
* Add your `DEV_URL` to your OS's `hosts` file
* Visit the `DEV_URL`

#### Staging Environment (ENV = STG)

* Run `stg.sh` to start the container -- it'll create a `projectname_dev` container
* Add your `STG_URL` to your OS's `hosts` file, **OR**;
* Make sure there's an A record pointing to your `STG_URL`
* Visit the `STG_URL`

#### Production Environment (ENV = STG)

* Run `prd.sh` to start the container -- it'll create a `projectname_dev` container
* Add your `PRD_URL` to your OS's `hosts` file, **OR**;
* Make sure there's an A record pointing to your `PRD_URL`
* Visit the `PRD_URL`

### Using Wordpress

Wordpress has a bit of a heartattack with this repo for some reason. You can force things in a cheeky manner by adding this to the top of your `wp-config.php` before the defines for the DB spec etc.

```
define( 'FORCE_SSL_ADMIN', true );
if ($_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') {
    $_SERVER['HTTPS']='on';
}
```

Only use this in **production** (or a web facing staging) environment though - when developing on local, things should work just fine.

To make things weirded - if you've just unzipped `latest.zip` and moved the contents of `wordpress/` into `code/` - you'll need to run the following commands:

`find code -type d -exec chmod 755 {} \;` from the touchstone root, finally, `chmod 775 code` itself.

`wp-config.php` should be `0644` (this is debatable for some, but it'll break touchstone if you don't for us.

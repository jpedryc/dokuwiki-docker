# <img src="https://www.dokuwiki.org/lib/tpl/dokuwiki/images/logo.png" width="60px" alt="DokuWiki" align="left" /> DokuWiki 🤝 Docker <img align="right" src="https://www.docker.com/sites/default/files/d8/2019-07/vertical-logo-monochromatic.png" alt="Docker" width="70px" />

## A dockerized setup for DokuWiki development

This setup was created to make development around DokuWiki easier and more maintainable. Just fork the original repo 
[splitbrain/dokuwiki](https://github.com/splitbrain/dokuwiki) and start playing around 🚀

###### 🧱 PHP 7.4 FPM | Composer (latest) | Xdebug (latest) | Nginx 1.8 Alpine

### Prerequisites
1. Make sure you have docker & docker-compose set-up.
2. Add `127.0.0.1 dokuwiki.local` in your _/etc/hosts_.   
   ℹ This is optional - you can customize the hostname in _server/dokuwiki.conf_
3. Create an _.env_ file and set up environmental variables accordingly.  
   ⤷ `cp .env.example .env`

--- 

### First run

Go to [/install.php](http://dokuwiki.local/install.php) and perform the standard DokuWiki install process.

--- 

### Xdebug in PHP Storm

###### Xdebug Port Settings
![Xdebug Port Settings](_assets/xdebug.png "Xdebug")

###### Server Path Mappings
![Server Path Mappings](_assets/server.png "Path Mappings")

---  

### Testing

#### Unit Testing

ℹ Before running any tests, you should fetch [PHPUnit](https://phpunit.de/) 
([DokuWiki - Unit Testing](https://www.dokuwiki.org/devel:unittesting)). You can do it by:  
`docker-compose exec app bash -c 'cd _test; php fetchphpunit.php'`

**To run all tests:**  
`docker-compose exec app bash -c 'cd _test; php phpunit.phar'`

**To run just a single file test:**  
`docker-compose exec app bash -c 'cd _test; php phpunit.phar tests/inc/input.test.php'`

Accordingly, to the original documentation, you should be able to cover all cases.

#### BrowserStack

🚧 🚧 🚧
  
---  

### Coding Style

#### PHP_CodeSniffer

ℹ Before running any code style checks, you should fetch 
[PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer). You can do it by:

1. `docker-compose exec app bash -c 'cd _test; wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar'`
2. `docker-compose exec app bash -c 'cd _test; wget https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar'`

⚠ These two files will be recognised by git as new files by default in the original (forked) repo. You can locally 
ignore them by adding their paths to _.git/info/exclude_.

**To check a single file:**  
`docker-compose exec app bash -c 'cd _test; php phpcs.phar ../feed.php'`

**To try fixing it:**  
`docker-compose exec app bash -c 'cd _test; php phpcbf.phar ../feed.php'`
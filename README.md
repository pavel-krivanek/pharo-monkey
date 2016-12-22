# pharo-monkey

The validator of issues from the Pharo issue tracker

## Usage

The validator expects the issue tracker user name and password in environment variables **PHARO_CI_USER** and **PHARO_CI_PWD**.

Moreover, for the reports it expects environment variables **BUILD_TAG** and **BUILD_URL**.

```
wget -O - http://get.pharo.org/vm60 | bash
git clone https://github.com/pavel-krivanek/pharo-monkey.git
bash ./pharo-monkey/scripts/validate-simple.sh next 60
```

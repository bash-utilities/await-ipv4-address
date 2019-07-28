# Await IPv4 Address Usage Example
[heading__title]:
  #await-ipv4-address-usage-example
  "&#x2B06; Top of this page"


> This branch is an example of how to utilize [`await-ipv4-address.sh`][branch_master__await_ipv4_address] script from the [`master`][master_branch] branch of this project; head over to the `master` branch of this repository if installation and utilization within your-own project is the goal.

## [![Open Issues][badge__issues__await_ipv4_address]][issues__await_ipv4_address] [![Open Pull Requests][badge__pull_requests__await_ipv4_address]][pull_requests__await_ipv4_address] [![Build Test Status][badge__travis_ci__await_ipv4_address]][travis_ci__await_ipv4_address] [![Latest commits][badge__commits__await_ipv4_address__example]][commits__await_ipv4_address__example]



------


#### Table of Contents


- [Example Usage][heading__example_usage]

- [License][heading__license]


------


## Example Usage
[heading__example_usage]:
  #example-usage
  ""


**`example-usage.sh`**


```Bash
bash example-usage.sh || echo "Exit code -> ${?}"
```


**Example output** when IP addresses are detected


```
#> Listing any iptables rules for -> 192.168.0.2
#> # ... iptables rules...
#> Listing any iptables rules for -> 192.168.0.4
#> # ... iptables rules...
```


**Example output** when **no** IP addresses are detected


```
#> something_networky got board of waiting for an IP
#> Exit code -> 1
```


___


## License
[heading__license]:
  #license
  "&#x00A9; Legal bits of Open Source software"


```
Await IPv4 Address submodule example usage documentation
Copyright (C) 2019  S0AndS0

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published
by the Free Software Foundation; version 3 of the License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```


[master_branch]: https://github.com/network-utilities/await-ipv4-address

[branch_master__await_ipv4_address]: https://github.com/network-utilities/await-ipv4-address/blob/master/await-ipv4-address.sh


[branch_example__example_usage]:
  https://github.com/network-utilities/await-ipv4-address/blob/example/example-usage.sh
  "Bash script that shows some ways of utilizing code from the master branch of this repository"


[badge__travis_ci__await_ipv4_address]:
  https://img.shields.io/travis/network-utilities/await-ipv4-address/example.svg

[travis_ci__await_ipv4_address]:
  https://travis-ci.com/network-utilities/await-ipv4-address
  "&#x1F6E0; Automated tests and build logs"


[badge__commits__await_ipv4_address__example]:
  https://img.shields.io/github/last-commit/network-utilities/await-ipv4-address/example.svg

[commits__await_ipv4_address__example]:
  https://github.com/network-utilities/await-ipv4-address/commits/example
  "&#x1F4DD; History of changes on this branch"


[badge__issues__await_ipv4_address]:
  https://img.shields.io/github/issues/network-utilities/await-ipv4-address.svg

[issues__await_ipv4_address]:
  https://github.com/network-utilities/await-ipv4-address/issues
  "&#x2622; Search for and _bump_ existing issues or open new issues for project maintainer to address."


[badge__pull_requests__await_ipv4_address]:
  https://img.shields.io/github/issues-pr/network-utilities/await-ipv4-address.svg

[pull_requests__await_ipv4_address]:
  https://github.com/network-utilities/await-ipv4-address/pulls
  "&#x1F3D7; Pull Request friendly, though please check the Community guidelines"

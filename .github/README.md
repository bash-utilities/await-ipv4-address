# Await IPv4 Address
[heading__title]:
  #await-ipv4-address
  "&#x2B06; Top of this page"


[`await-ipv4-address.sh`][await_ipv4_address__master__source_code], contains a function that returns listening ports for a given service, even if it has to wait a few seconds, and even if the listening ports are not known in advance; such as in the case with `librespot` service.


> The following covers how to install this branch as a submodule within your own project, and parameters that `await-ipv4-address.sh` currently responds to.


## [![Byte size of await-ipv4-address.sh][badge__master__await_ipv4_address__source_code]][await_ipv4_address__master__source_code] [![Open Issues][badge__issues__await_ipv4_address]][issues__await_ipv4_address] [![Open Pull Requests][badge__pull_requests__await_ipv4_address]][pull_requests__await_ipv4_address] [![Build Test Status][badge__travis_ci__await_ipv4_address]][travis_ci__await_ipv4_address] [![Latest commits][badge__commits__await_ipv4_address__master]][commits__await_ipv4_address__master]



------


#### Table of Contents


- [&#x2B06; Top of ReadMe File][heading__title]

- [:zap: Quick Start][heading__quick_start]

  - [:memo: Edit Your ReadMe File][heading__edit_your_readme_file]
  - [:shell: Example Bash Script][heading__example_bash_script]
  - [:floppy_disk: Commit and Push][heading__commit_and_push]

- [:scroll: await-ipv4-address.sh Positional Arguments][heading__api]

- [&#x1F5D2; Notes][notes]

- [:card_index: Attribution][heading__attribution]

- [:copyright: License][heading__license]


------


## Quick Start
[heading__quick_start]:
  #quick-start
  "&#9889; ...well as quick as it may get with things like this"


**Bash Variables**


```Bash
_module_https_url='https://github.com/network-utilities/await-ipv4-address.git'
_module_relative_path='lib/modules/await-ipv4-address'
```


**Git Commands**


```Bash
cd "your-project-path"

git submodule add\
 -b master\
 --name await-ipv4-address\
 "${_module_https_url}" "${_module_relative_path}"
```


> **Version Locking**; recommended for those that audit every dependency...


```Bash
git checkout tags/<tag_name> -b <branch_name>
```


> ... replace _`<tag_name>`_ with the tag to checkout and _`<branch_name>`_ with a custom name, eg...


```Bash
git checkout tags/v0.0.1 -b loc-v0.0.1
```


### Edit Your ReadMe File
[heading__edit_your_readme_file]:
  #edit-your-readme-file
  "&#x1F4DD; Suggested additions so everyone has a good time with submodules"


Suggested additions so everyone has a good time with submodules


```MarkDown
Clone with the following to avoid incomplete downloads


    git clone --recurse-submodules <url-for-your-project>


Update/upgrade submodules via


    git submodule update --init --recursive --remote --merge


Please review the official documentation for Git submodules...


    git help submodule


... or via [Submodules chapter][git_book__submodules] from Git.



[git_book__submodules]:
  https://git-scm.com/book/en/v2/Git-Tools-Submodules
  "Valuable information for daily use and recovering from a detached HEAD"
```


### Example Bash Script
[heading__example_bash_script]:
  #example-bash-script
  "&#x1F41A; Source and utilize await_ipv4_address features"


[**`example-usage.sh`**][branch_example__example_usage]


```Bash
#!/usr/bin/env bash


## Enable sourcing via absolute path
__SOURCE__="${BASH_SOURCE[0]}"
while [[ -h "${__SOURCE__}" ]]; do
    __SOURCE__="$(find "${__SOURCE__}" -type l -ls | sed -n 's@^.* -> \(.*\)@\1@p')"
done
__DIR__="$(cd -P "$(dirname "${__SOURCE__}")" && pwd)"


source "${__DIR__}/modules/await-ipv4-address/await-ipv4-address.sh"


## Lists iptables rules targeting IP, waits up-to seven seconds for an IP on eth0 interface
something_networky(){
    local _assigned_ips=($(await_ipv4_address 'eth0' '1' '6'))
    if [ -z "${_assigned_ips}" ]; then
        printf '%s got board of waiting for an IP\n' "${FUNCNAME[0]}"
        return 1
    fi

    for _assigned_ip in "${_assigned_ips[@]}"; do
        printf 'Listing any iptables rules for -> %s\n' "${_assigned_ip%/*}"
        iptables -S | grep -- "${_assigned_ip%/*}"
    done
}


something_networky
```


**Testing `example-usage.sh`**


```Bash
bash example-usage.sh || echo "Exit code -> ${?}"
```


Utilize the above example to make similar edits to any of your project scripts that should wait for an IP.


### Commit and Push
[heading__commit_and_push]:
  #commit-and-push
  "&#x1F4BE; And congratulate yourself on not having to write something similar!"



```Bash
git add .gitmodules
git add lib/modules/await-ipv4-address
git add README.md


git commit -F- <<'EOF'
:heavy_plus_sign: Adds network-utilities/await-ipv4-address dependency



**Additions**


- `.gitmodules` file, tracks other Git repository code utilized by this project

- `lib/modules/await-ipv4-address` submodule, Git tracked dependency


**Edits**


- `README.md` file, documentation updates for submodules
EOF


git push origin gh-pages
```


**:tada: Excellent :tada:** your project is now ready to begin unitizing code of this repository!


___


## Await IPv4 Address API
[heading__api]:
  #await-ipv4-address-api
  "&#x1F4DC; The incantations that await_ipv4_address function understands"


| Param | Type |  | Description |
|---|---|---|---|
| `$1` | string | **required** | example `eth0` or `wlan0`, the interface name to wait for an IP address to be active on |
| `$2` | number | `1` | Number of seconds to sleep between checks |
| `$3` | number | `10` | Max number of loops before function fails silently |


**Returns: `<address|list>`**, IP address or space separated list of addresses


**Throws** `Parameter_Error: await_ipv4_address not provided an interface`, when first parameter is not defined


**Example:** as an array


```Bash
_ip_addresses_list=($(await_ipv4_address 'eth0'))

printf 'Listening address: %s\n' "${_ip_addresses_list[@]}"
#> Listening address: 192.168.0.2
#> Listening address: 192.168.0.4
```


**Example:** as a string


```Bash
_ip_addresses_string="$(await_ipv4_address 'eth0')"

printf 'Listening address(es): %s\n' "${_ip_addresses_string}"
#> Listening address(es): 192.168.0.2 192.168.0.4
```


___


## Notes
[notes]:
  #notes
  "&#x1F5D2; Additional notes and links that may be worth clicking in the future"


Pull Requests are welcomed! Check the _`Community`_ section for development tips and code of conduct.


___


## Attribution
[heading__attribution]:
  #attribution
  "&#x1F4C7; Resources that where helpful in building this project so far."


- [`Improved (=reliable) Wait for Network implementation`](https://www.raspberrypi.org/forums/viewtopic.php?t=187225)


___


## License
[heading__license]:
  #license
  "&#x00A9; Legal bits of Open Source software"


```
Await IPv4 Address submodule quick start documentation
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



[badge__travis_ci__await_ipv4_address]:
  https://img.shields.io/travis/network-utilities/await-ipv4-address/example.svg

[travis_ci__await_ipv4_address]:
  https://travis-ci.com/network-utilities/await-ipv4-address
  "&#x1F6E0; Automated tests and build logs"


[branch_example__example_usage]:
  https://github.com/network-utilities/await-ipv4-address/blob/example/example-usage.sh
  "Bash script that shows some ways of utilizing code from the master branch of this repository"


[badge__commits__await_ipv4_address__master]:
  https://img.shields.io/github/last-commit/network-utilities/await-ipv4-address/master.svg

[commits__await_ipv4_address__master]:
  https://github.com/network-utilities/await-ipv4-address/commits/master
  "&#x1F4DD; History of changes on this branch"


[await_ipv4_address__community]:
  https://github.com/network-utilities/await-ipv4-address/community
  "&#x1F331; Dedicated to functioning code"


[await_ipv4_address__example_branch]:
  https://github.com/network-utilities/await-ipv4-address/tree/example
  "If it lurches, it lives"


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


[badge__master__await_ipv4_address__source_code]:
  https://img.shields.io/github/size/network-utilities/await-ipv4-address/await-ipv4-address.sh.svg?label=await-ipv4-address.sh

[await_ipv4_address__master__source_code]:
  https://github.com/network-utilities/await-ipv4-address/blob/master/await-ipv4-address.sh
  "&#x2328; Project source code!"

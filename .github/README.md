# Await IPv4 Address
[heading__title]:
  #await-ipv4-address
  "&#x2B06; Top of this page"


------


#### Table of Contents


- [&#x2B06; Top of ReadMe File][heading__title]

- [:zap: Quick Start][heading__quick_start]

  - [:memo: Edit Your ReadMe File][heading__edit_your_readme_file]
  - [&#x1F578; Example Bash Script][heading__example_bash_script]
  - [:floppy_disk: Commit and Push][heading__commit_and_push]

- [:scroll: await_ipv4_address.sh Positional Arguments][heading__api]

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
_module_https_url='https://github.com/bash-utilities/await-ipv4-address.git'
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


**Quick Start Section**


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
  "&#x1F578; Source and utilize await_ipv4_address features"


**`example.sh`**


```Bash
#!/usr/bin/env bash


## Enable sourcing via absolute path
__SOURCE__="${BASH_SOURCE[0]}"
while [[ -h "${__SOURCE__}" ]]; do
    __SOURCE__="$(find "${__SOURCE__}" -type l -ls | sed -n 's@^.* -> \(.*\)@\1@p')"
done
__PARENT__="$(cd -P $(dirname "${__SOURCE__}") && pwd)"
__NAME__="${__SOURCE__##*/}"
__PATH__="${__PARENT__}/${__NAME__}"


source "${__PARENT__}/await_ipv4_address.sh"


## Waits up-to one minuet for an IP on eth0 interface before
##  doing something network related with it or exiting with error
_assigned_ip="$(await_ipv4_address 'eth0' '3' '19')"

if [ -z "${_assigned_ip}" ]; then
    printf '%s got board of waiting for an IP\n' "${__NAME__}"
    exit 1
fi
printf 'Listing any iptables rules for -> %s\n' "${_assigned_ip%/*}"
iptables -S | grep -- "${_assigned_ip%/*}"
```


**Testing `example.sh`**


```Bash
bash example.sh || echo "Exit code -> ${?}"
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
:heavy_plus_sign: Adds bash-utilities/await-ipv4-address dependency


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


## Await IPv4 Address Positional Arguments
[heading__api]:
  #await-ipv4-address-positional-arguments
  "&#x1F4DC; The incantations that await_ipv4_address function understands"


- `_interface` **required** example `eth0` or `wlan0`, the interface name to wait for an IP address to be active on

- `_sleep_interval` **defaults to** `1`, the number of seconds to sleep between checking if `_interface` has an IP address

- `_loop_limit` **defaults to** `10`, the number of iterations to wait till exiting without any IP address


___


## Notes
[notes]:
  #notes
  "&#x1F5D2; Additional notes and links that may be worth clicking in the future"


Pull Requests are welcomed! Check the `gh-pages` branch and _`Community`_ section for development tips and code of conduct.


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

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



## @license
# Await IPv4 Address submodule example usage documentation
# Copyright (C) 2019  S0AndS0
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation; version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

#!/usr/bin/env bash


##   await_ipv4_address <interface> sleep_interval loop_limit
await_ipv4_address(){
    local _interface="${1:?${FUNCNAME[0]} not provided an interface}"
    local _sleep_interval="${2:-1}"
    local _loop_limit="${3:-10}"

    local _loop_count='0'
    while [ -z "$({ ip addr show ${_interface} | awk '/inet /{print $2}'; } 2>/dev/null)" ]; do
        if [ "${_loop_count}" -gt "${_loop_limit}" ]; then
            break
        fi
        sleep "${_sleep_interval:-1}"
        let _loop_count+=1
    done

    printf '%s' "$(ip addr show ${_interface} | awk '/inet /{print $2}')"
}



# Await IPv4 Address function for Bash scripts that wait for such things
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

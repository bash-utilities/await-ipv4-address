#!/usr/bin/env bash


## Lists IP addresses for given interface name
## @returns {number|list}
## @param {string} _interface      - Name of interface to monitor for IP address(es)
## @param {number} _sleep_intervel - Number of seconds to sleep between checks
## @param {number} _loop_limit     - Max number of loops before function returns error code
## @author S0AndS0
## @copyright AGPL-3.0
## @exampe As an array
##     _addresses_list=($(await_ipv4_address 'eth0'))
##     printf 'Listening address: %s\n' "${_addresses_list[@]}"
##     #> Listening address: 192.168.0.2
##     #> Listening address: 192.168.0.4
## @example As a string
##     _addresses_string="$(await_ipv4_address 'eth0' '1' '3')"
##     printf 'Listening address(es): %s\n' "${_addresses_string}"
##     #> Listening address(es): 192.168.0.2 192.168.0.4
await_ipv4_address(){
    local _interface="${1:?# Parameter_Error: ${FUNCNAME[0]} not provided an interface}"
    local _sleep_interval="${2:-1}"
    local _loop_limit="${3:-10}"

    if [ "${_sleep_interval}" -le '0' ] || [ "${_loop_limit}" -le '0' ]; then
        printf 'Parameter_Error: %s requires positive numbers for second and third parameters\n' "${FUNCNAME[0]}" >&2
        return 1
    fi

    local _loop_count='0'
    local -a _ipv4_addresses
    while true; do
        while IFS= read -r _address; do
            [[ -n "${_address}" ]] || continue
            _ipv4_addresses+=("${_address}")
        done <<<"$({ ip addr show ${_interface} | awk '/inet /{print $2}'; } 2>/dev/null)"

        if [ "${#_ipv4_addresses[@]}" -gt '0' ]; then
            printf '%s\n' "${_ipv4_addresses[*]}"
            break
        elif [ "${_loop_count}" -gt "${_loop_limit}" ]; then
            break
        fi

        let _loop_count+=1
        sleep "${_sleep_interval}"
    done

    [[ "${#_ipv4_addresses[@]}" -gt '0' ]]; return "${?}"
}

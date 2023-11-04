// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

abstract contract dbarAccessList {
    address[] internal whitelist;
    address[] internal blacklist;

    mapping(address => bool) internal _whitelisted;
    mapping(address => bool) internal _blacklisted;

}
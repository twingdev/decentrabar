// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


abstract contract dbarOwnershipMetas {
    address[] public founders;
    address[] internal holders;
    mapping(address => bool) internal _holders;
    mapping(address => bool) public _founders;
    uint256 public numHolders;
    uint256 public numFounders;


    function _addFounder(address _founder) internal {

    }

    function _remFounder(address _founder) internal {

    }

    function _addHolder(address _holder) internal {

    }

    function _remHolder(address _holder) internal {

    }

    function getAllHolders() internal view returns(address[] memory) {
        uint i = 0;
        address[] memory __holders;
        for(i = 0; i < holders.length; i+=1) {
            __holders[i] = holders[i];
        }
        return __holders;

    }




}
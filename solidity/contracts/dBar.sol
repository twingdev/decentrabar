// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./dBarAccessList.sol";
import "./dBarOwnershipMetas.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/access/manager/AccessManaged.sol";
import "./dBarAdmin.sol";

//***
// @title dBar token contract
// @dev erc20 standard token
// @notice this is the contract for the ethereum DBAR (decentrabar) token
//


contract dbar is ERC4626(IERC20(address(this))), AccessManaged {


    string public logoUrl;
    uint256 public _totalSupply;
    uint public version;
    address public admin;
    dBarAdmin internal __admin;


    constructor(address _admin) AccessManaged(_admin) ERC20("DecentraBar", "DBAR") {



        version = 1;
    }

    function setTotalSupply(uint256 supply) public restricted{
        _totalSupply = supply;
    }

    function updateVersion(uint versionNumber) public restricted {
        version = versionNumber;
    }

    function setLogoURL(string memory url) public restricted {
        logoUrl = url;
    }


}
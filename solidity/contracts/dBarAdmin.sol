// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./dBarAccessList.sol";
import "./dBarOwnershipMetas.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";

import "@openzeppelin/contracts/access/manager/AccessManager.sol";

///
/// @title dBar admin contract
/// @dev check openzeppelin documentation
/// @notice this is the contract to administrate the access to restricted functions
///

contract dBarAdmin is AccessManager(msg.sender), dbarAccessList {

    function blacklistAddress(address _bla) public onlyAuthorized {
        require(_blacklisted[_bla] != true, "already blacklisted");
        blacklist.push(_bla);
        _blacklisted[_bla] = true;
    }


    function whitelistAddress(address _bla) public onlyAuthorized {
        require(_blacklisted[_bla] != true, "cannot whitelist a blacklisted address");
        require(_whitelisted[_bla] != true, "already whitelisted");

        whitelist.push(_bla);
        _whitelisted[_bla] = true;
    }


}



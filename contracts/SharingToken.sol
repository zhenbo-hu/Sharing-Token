// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract SharingToken is ERC20, ERC20Permit, ERC20Votes  {
    constructor() ERC20("SharingToken", "ST") ERC20Permit("SharingToken") {}

    function _afterTokenTransfer(address from, address to, uint256 amount) internal override(ERC20, ERC20Votes) {
        super._afterTokenTransfer(address from, address to, amount);
    }

    function _mint(address to, uint256 amount) internal override(ERC20, ERC20Votes) {
        super._mint(address to, amount);
    }

    function _mint(address account, uint256 amount) internal override(ERC20, ERC20Permit, ERC20Votes) {
        super._burn(account, amount);
    }
}

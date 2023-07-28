// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC20/ERC20.sol";

contract NeoToken is ERC20{

    constructor(string memory _name, string memory _symbol)ERC20(_name, _symbol){
        _mint(_msgSender(), 1000 ether);
    }
}
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./Context.sol";

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 */
contract OwnableContract is Context {
    address private _owner;
    mapping (address => bool) private _whitelistedAdmin;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event AdminAdded(address indexed addedBy, address indexed newAdmin);
    event AdminRemoved(address indexed removedBy, address indexed admin);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _transferOwnership(_msgSender());
        _whitelistedAdmin[_msgSender()] = true;
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner(address _address) {
        require(owner() == _address, "Ownable: caller is not the owner");
        _;
    }

    /**
     * @dev Throws if called by any account other than the whitelistedAdmin.
     */
    modifier onlyWhitelistedAdmin(address _address){
        require(_whitelistedAdmin[_address], "Ownable: caller is not the whitelisted admin");
        _;
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Return `true` if the @param _address is the whitelistedAdmin else `false`.
     */
    function admin(address _address) external view returns(bool){
        return _whitelistedAdmin[_address];
    }

    /**
     * @dev Add new Admin to _whitelistedAdmin mapping.
     * Can only be called by the current owner and existing admin.
     */
    function addWhitelistedAdmin(address _whitelistAdmin)external onlyWhitelistedAdmin(msg.sender) returns(bool){
        require(!_whitelistedAdmin[_whitelistAdmin], "Ownable: already a whitelisted admin");
        _whitelistedAdmin[_whitelistAdmin] = true;
        emit AdminAdded(msg.sender, _whitelistAdmin);
        return true;
    }

    /**
     * @dev Remove existing Admin from _whitelistedAdmin mapping.
     * Can only be called by the current owner and existing admin.
     * Existing admin will not able to remove him/her self form _whitelistedAdmin mapping.
     */
    function removeWhitelistedAdmin(address _whitelistAdmin)external onlyWhitelistedAdmin(msg.sender) returns(bool){
        require(_whitelistedAdmin[_whitelistAdmin], "Ownable: not a whitelisted admin");
        require(_whitelistAdmin != msg.sender, "Ownable: self-remove not allowed");
        _whitelistedAdmin[_whitelistAdmin] = false;
        emit AdminRemoved(msg.sender, _whitelistAdmin);
        return true;
    }

    /**
     * @dev Return `true` if the @param _address is the whitelistedAdmin else `revert`.
     */
    function checkAdmin(address _address) external view onlyWhitelistedAdmin(_address) returns(bool){
        return true;
    }

    /**
     * @dev Return `true` if the @param _address is the owner else `revert`.
      */
    function checkOwner(address _address) external view onlyOwner(_address) returns(bool){
        return true;
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner(msg.sender) {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20WrapperUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";



contract WGXB is Initializable, ERC20WrapperUpgradeable,OwnableUpgradeable, PausableUpgradeable {


    function initialize(

        IERC20Upgradeable _underlyingToken,
        string memory name,
        string memory symbol
        
        ) 
        initializer public {
        __Ownable_init();
         __Pausable_init();
       __Context_init_unchained();
        __ERC20_init_unchained(name, symbol);
        __ERC20Wrapper_init_unchained(_underlyingToken);     
         }
        // @dev Mint wrapped token to cover any underlyingTokens that would have been transfered by mistake. Internal
        function recover(address account) public returns (uint256) {
        return _recover(account);
    }
 
}

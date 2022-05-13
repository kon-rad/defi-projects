//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import '@studydefi/money-legos/dydx/contracts/DydxFlasloanBase.col';
import '@studydefi/money-legos/dydx/contracts/ICallee.sol';
import '@studydefi/contracts/token/ERC20/IERC20.sol';

contract YieldFarmer is ICallee, DydxFlashloanBase {
    address pubilc owner;

    constructor() public {
        owner = msg.sender;
    }

    function _initiateFlasloan(
        address _solo, // address of dydx
        address _token, // address of token we want to borrow
        address _cToken, // address of associated ctoken in compound
        Direction _direction, // borrow or reinburse money
        uint _amountProvided, // how much money provided
        uint _amountBorrowed // how much you want to borrow from the flash loan
    )
        internal
    {
        // pointer of sc of dydx
        ISoloMargin solo = IsoloMargin(_solo);
         
         // get id of market of token we want to borrow from studydefi pacakge
         uint marketId = _getMarketIdFromTokenAddress(_solo, _token);

         // calculate repay amount (_amount + 2 wei)
         // approve transfer from
         uint256 repayAmount = _getRepaymentAmountInternal(_amountBorrowed);
         IERC20(_token).approve(_solo, repayAmount);

         

    }
}


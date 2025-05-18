// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    
    uint256 public constant MINIMUM_AMOUNT = 5e18;


    address[] public funders;
    mapping (address => uint256) public fundersAddress;

    function fund() public payable {
        require(
            msg.value.getConversionRate() >= MINIMUM_AMOUNT,
            "Must send at least 1 ETH"
        );

        address payer = payable(msg.sender);
        funders.push(payer);
        fundersAddress[payer] += msg.value;
    }

    function withdraw() public {}
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;
    
    uint256 public constant MINIMUM_AMOUNT = 5e18;


    address[] public funders;
    mapping (address => uint256) public fundersAddress;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        require(
            msg.value.getConversionRate() >= MINIMUM_AMOUNT,
            "Must send at least 1 ETH"
        );

        address payer = payable(msg.sender);
        funders.push(payer);
        fundersAddress[payer] += msg.value;
    }

    function withdraw() public onlyOwner {
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) 
        {
           address funder = funders[funderIndex];
           fundersAddress[funder] = 0;
        }

        funders = new address[](0);

        // transfer the eth
        // payable(msg.sender).transfer(address(this).balance);

        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Failed to send Ether");

        // call
        (bool success,) = payable(msg.sender).call{value: address(this).balance}("");
        require(success, "Call failed");
    }

    modifier  onlyOwner() {
        require(msg.sender == i_owner, "Not authorized");
        _;
    }


    receive() external payable { 
        fund();
    }

    fallback() external payable { 
        fund();
    }
}
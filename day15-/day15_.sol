// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GasEfficientVoting {
    uint8 public proposalCount;

    struct Proposal {
        bytes32 name;      // 比 string 省 Gas，固定长度直接存储
        uint32 voteCount;  // 42亿上限够用了，只占 4 字节
        uint32 startTime;  // 时间戳用 uint32 可以用到 2106 年
        uint32 endTime;
        bool executed;     // 布尔值占 1 字节
    }

    mapping(uint8 => Proposal) public proposals;
    mapping(address => uint256) private voterRegistry;

    event ProposalCreated(uint8 indexed proposalId, bytes32 name);

    
}
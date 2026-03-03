// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PollStation {

    string[] public candidateNames;
    mapping (string => bool) public isCandidate;
    mapping (string => uint256) public voteCount;
    mapping (address => bool) public isVoted;

    // 添加候选人姓名
    function addCandidateNames (string memory _name) public {
        candidateNames.push(_name);
        voteCount[_name] = 0;
        isCandidate[_name] = true;
    }    

    // 检索候选人列表
    function getCandidateNames () public view returns (string[] memory) {
        return candidateNames;
    }

    // 为候选人投票篇
    function voteForCandidate(string memory _name, address _voter) public {
        require(validCandidate(_name));
        voteCount[_name] += 1;
        isVoted[_voter] = true;
    }

    // 检查候选人的票数
    function getVoteCount(string memory _name) public view returns (uint256) {
        return voteCount[_name];
    }

    // 检查候选人是否存在
    function validCandidate(string memory _name) public view returns (bool) {
        return isCandidate[_name];
    }

    // 检查投票人是否已经投过票
    function hasVoted(address _voter) public view returns (bool) {
        return isVoted[_voter];
    }
}


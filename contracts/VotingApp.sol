pragma solidity ^0.8.0;

contract VotingApp {
    struct Candidate {
        string name;
        uint voteCount;
    }
    
    mapping(address => bool) public voters;
    mapping(uint => Candidate) public candidates;
    uint public candidatesCount;
    
    event UpdatedVotingResult(uint firstCandidateVoteCount, uint secondCandidateVoteCount);
    
    constructor() {
        addCandidate("John Smith");
        addCandidate("Jane Smith");
    }
    
    function addCandidate(string memory _name) private {
        candidates[candidatesCount] = Candidate(_name, 0);
        candidatesCount++;
    }
    
    function vote(uint _candidateId) public {
        require(!voters[msg.sender], "You have already voted.");
        require(_candidateId >= 0 && _candidateId < candidatesCount, "Invalid candidate ID.");
        
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount++;

        emit UpdatedVotingResult(candidates[0].voteCount, candidates[1].voteCount);
    }
}
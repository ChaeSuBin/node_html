pragma solidity ^0.8.1;

    import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol';
    import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol';
    
    contract Try3DeployTest721Ropsten is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    uint256 tokenBalance;
    struct myStruct
    {
        //
    }

    constructor() ERC721("Try3DeployTest721Ropsten", "DTRC") {
        //_setBaseURI("ipfs://");
    }

    function mintToken(address owner, string memory tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 tokenId = _tokenIds.current();
        _mint(owner, tokenId);
        _setTokenURI(tokenId, tokenURI);

        return tokenId;
    }
    
    function balanceQuery(address account)
        public
        returns (uint256)
    {
        uint256 bal = balanceOf(account);
        return bal;
    }
}
//CA: 0xf8345d33976634B2e5d8a420a75D7327781eB8CB
pragma solidity ^0.8.1;

    import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol';
    import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol';
    //import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721Enumerable.sol';
    
    contract Try4DeployTest721Ropsten is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    constructor() ERC721("Try4DeployTest721Ropsten", "DTRD") {
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
    
    function totalSupply() public view returns(uint256)
    {
        //return numberOfamount;
        return _tokenIds.current();
    }
    
    function cus_tokenURI(uint256 tokenId) public view returns(string memory)
    {
        require(_exists(tokenId), "ERR-ERC721Metadata: URI query for nonexistent token");
        return tokenURI(tokenId);
    }
    
    function cus_ownerOf(uint256 tokenId) public view returns(address){
        return ownerOf(tokenId);
    }
    
    function balanceQuery(address account)
        public
        view
        returns (uint256)
    {
        require(account != address(0), "ERR-ERC721: balance query for the zero address");
        return balanceOf(account);
    }
}
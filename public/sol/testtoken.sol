pragma solidity ^0.8.1;

    import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol';
    import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol';
    //import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721Enumerable.sol';
    
    contract Try3DeployTest721Ropsten is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    //uint256 numberOfamount;
    
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
        //numberOfamount++;

        return tokenId;
    }
    
    function symbol() public view virtual override returns (string memory)
    {
        return symbol;
    }
    
    function totalSupply() public view returns(uint256)
    {
        //return numberOfamount;
        return _tokenIds.current();
    }
    
    function cus_tokenURI(uint256 tokenId) public view returns(string memory)
    {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
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
        //uint256 bal = balanceOf(account);
        return balanceOf(account);
    }
}
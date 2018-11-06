pragma solidity ^0.4.24;

// ERC20 token interface
contract ERC20 {
    function totalSupply() public constant returns (uint);
    function balanceOf(address tokenOwner) public constant returns (uint balance);
    function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
    function transfer(address to, uint tokens) public returns (bool success);
    function approve(address spender, uint tokens) public returns (bool success);
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

//Market maker contract implementation
contract MarketMaker
{
    address public khanAddress;
    address public gwAddress;
    uint maxValueToExchange;
    uint buyOnMinAmount;
    uint minTokenBalance;
    
    //event is called on each token exchange 
    event exchange( address indexed from, uint inputToken, uint outputToken, string fromToken, string toToken );

    //"0xfAB9D5b3504Fa717cB87A61534240503b60b0F92","0x27F5BB4edEeAD3854A89e9fe6ac2467A1aB5cbD4"
    // @khanTokenAddress
    // @gwTokenAddress
    constructor (address khanTokenAddress, address gwTokenAddress, uint maxExValue, uint minBalance, uint buyAmount) public {
        khanAddress = khanTokenAddress;
        gwAddress = gwTokenAddress;
        
        maxValueToExchange = maxExValue;
        buyOnMinAmount = buyAmount;
        minTokenBalance = minBalance;
    }

    // @khanAmount amount of khan tokens in wei
    function exchangeKHANtoGW( uint khanAmount ) public {
        
        require( khanAmount < maxValueToExchange );

        uint gwToTransfer = getGWToTransfer( khanAmount );

        //transfer khan token from khan seller address to market maker address
        ERC20(khanAddress).approve( address(this), khanAmount );
        ERC20(khanAddress).transferFrom( msg.sender, address(this), khanAmount );
        
        //transfer GW from market maker address to khan seller address
        ERC20(gwAddress).transfer(msg.sender, gwToTransfer);
        
        checkGwBlanace();
        //call event to log
        emit exchange( msg.sender, khanAmount, gwToTransfer, "KHAN", "GW" );
    }
    

    // @gwAmount amount of gw tokens in wei
    function exchangeGWToKHAN( uint gwAmount ) public {
        
        require( gwAmount < maxValueToExchange );
        
        uint khanToTransfer = getKhanToTransfer(gwAmount );
        
        //transfer GW token from GW seller address to market maker address
        ERC20(gwAddress).approve(address(this), gwAmount );
        ERC20(gwAddress).transferFrom(msg.sender, address(this), gwAmount);
        
        //transfer KHAN from market maker address to GW seller address
        ERC20(khanAddress).transfer(msg.sender, khanToTransfer);
        
        checkGwBlanace();
        //call event to log
        emit exchange( msg.sender, gwAmount, khanToTransfer, "GW", "KHAN" );
    }
    
    function checkGwBlanace () public {
        
        if( ERC20(gwAddress).balanceOf(address(this)) < minTokenBalance) 
        {
            exchangeKHANtoGW(buyOnMinAmount); //sell KHAN
        }
        
        if( ERC20(khanAddress).balanceOf(address(this)) < minTokenBalance) 
        {
            exchangeGWToKHAN(buyOnMinAmount); //sell GW
        }
    }
    
        // @khanAmount 
    function getGWToTransfer( uint khanAmount ) public view returns (uint) {
        return khanAmount * getGWAmount() / getKHANAmount();
    }


    // @gwAmount 
    function getKhanToTransfer (uint gwAmount) public view returns (uint) {
        return gwAmount * getKHANAmount() / getGWAmount();
    }
    
    // START helper methods
    function getMarketMakerAddress () public view returns   (address){
        return address(this);
    }
    
    function getGWAmount() public view returns (uint) {
        return  ERC20(gwAddress).balanceOf(address(this)) ;
    }
   
    function getKHANAmount() public view returns (uint) {
        return  ERC20(khanAddress).balanceOf(address(this)) ;
    }
    // END helper methods 
}
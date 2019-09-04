pragma solidity ^0.4.11;

contract verlink_ico{

uint public max_verlink=1000000;
uint usd_to_verlink=1000;
uint total_verlink_bought=0;

mapping(address=>uint)equity_verlink;
mapping(address=>uint)equity_usd;

modifier can_buy_verlink(uint usd_invested){
    require (usd_invested*usd_to_verlink+total_verlink_bought <= max_verlink);
    _;
    }
    
function equity_in_usd(address investor) external constant returns(uint){
    return equity_usd[investor];
    }

function equity_in_verlink(address investor) external constant returns(uint){
    return equity_verlink[investor];
    }
    
function buy_verlink(address investor,uint usd_invested) external
can_buy_verlink(usd_invested) {
    uint verlink_bought=usd_invested*usd_to_verlink;
    equity_verlink[investor] += verlink_bought;
    equity_usd[investor]= equity_verlink[investor]/usd_to_verlink;
    total_verlink_bought += verlink_bought;
    }

function sell_verlink(address investor, uint verlink_sold) external {
    equity_verlink[investor] -= verlink_sold;
    equity_usd[investor] = equity_hadcoin[investor]/usd_to_verlink;
    total_verlink_bought -= verlink_sold;
    }
}

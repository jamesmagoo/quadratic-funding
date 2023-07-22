# Quadratic Funding - Build
This is a learning exercise on quadratic funding; what is it, on  how it works, and how to implement it using smart contracts on the EVM. 

## Pseudo Code 
`MainQuadraticFund.sol`
- Need to build a main contract that will:
    - Hold the matching pool money
    - Allow projects to submit to the fund.
    - Allow people to send donations to these projects.
    - At a given time, close the funding channels, calculate who gets what, and then sends them the cash. 

Design Notes:
- For this exercise , maybe the end of the funding round can be triggered by the MainQuadFund owner. In reality I think this would be on a timing mechanism i.e. the funding round closes on X date at Y time. At this point no more funders can doante, and the 'votes' will be calculated & the spoils will be shared. 
- Helpful to think of somebody's donation as their 'vote' for a particular project to succeed.
- Would be cool to have a UI that anyone can spin up a fund and run through a test fund sequence where they; can spin up dummy projects, vote/fund with dummy people, and then see how it all gets distributed at the end. 


## WTF is Quadratic Funding?

>_Magnify/boost the funding of public goods_

WTF are public goods?
> ChatGPT 🫡: Public goods are items or services that everyone has access to and can use. Even if one person uses them, it doesn't prevent others from also using them. Examples include parks, street lights, and clean air.

## The Gist
- At the core of quadratic funding is the _matching pool_ - a pot of money provided by the matching partners or donors. This is the pot that gets distributed on top of individual donor contributions. Funds are used magnify the individual contributions.
- More contributors = higher matched €
- Incentivises smaller contributors over big contributors (whales)
- Anyone can make a contribution to any project; a mechanism (smart contract) keeps track of these contributions and then at the end of some period of time the mechanism (smart contract) calculates a payment to each project. ***The way that this payment is calculated is as follows: for any given project, take the square root of each contributor's contribution, add these values together, and take the square of the result.***

![Overview](./docs/quadratic_voting.png)
- In any case where there is more than one contributor, the computed payment is greater than the raw sum of contributions; the difference comes out of a central subsidy pool (eg. if ten people each donate $1, then the sum-of-square-roots is $10, and the square of that is $100, so the subsidy is $90). Note that if the subsidy pool is not big enough to make the full required payment to every project, we can just divide the subsidies proportionately by whatever constant makes the totals add up to the subsidy pool's budget; **you can prove that this solves the tragedy-of-the-commons problem as well as you can with that subsidy budget**.

!['The Math'](./docs/quadratic_voting_maths.png)

## References
Vitalik Buterin's Blog
https://vitalik.ca/general/2019/12/07/quadratic.html

How Can $1 Turn Into $27? QUADRATIC FUNDING Explained
https://www.youtube.com/watch?v=hEHv-dE4xl8
https://finematics.com/quadratic-funding-explained/

Quadratic Funding - A Better Way To Fund Public Goods
https://blog.woodstockfund.com/2021/05/20/quadratic-funding-a-better-way-to-fund-public-goods/

Gitcoin
https://www.gitcoin.co/
Description
===========

API to Templatize Solidity contracts for Deed Registries and deploy these Deed Registries on chain.


Usage
=====

Truffle handles the deploys so we need to write a `truffle.js`. If you don't have a local node, then you'll need to use a third-party service like Infura. Truffle will also need to manage your private key via its mnemonic.

    var HDWalletProvider = require("truffle-hdwallet-provider");

    var mnemonic = 'add bulb cheese mechanic series skull drink loser script sick glare later oppose wool woof'

    module.exports = {
      networks: {
        ropsten: {
          provider: function() {
            // *do not* include the proto with the infura address
            return new HDWalletProvider(mnemonic, "ropsten.infura.io/apikey")
          },
          network_id: 3
        }
      }
    };


If you have your own node you would rather use, replace `truffle.js` with something like this:

    module.exports = {
      rpc: {
        host: "127.0.0.1",
        port: 8545
      }
    };





Docker
------


    docker build -t deedcontainer-api
    docker run --rm -it -v $(pwd):/workspace -e FLASK_APP=/workspace/app.py deedfactory-api

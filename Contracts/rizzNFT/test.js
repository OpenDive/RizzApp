let StandardMerkleTree = require("@openzeppelin/merkle-tree");


// (1)
const values = [
    ["0x1111111111111111111111111111111111111111", "5000000000000000000"],
    ["0x2222222222222222222222222222222222222222", "2500000000000000000"],
    ["0x3322222222222222222222222222222222222223", "270000000000000000"]
]

// (2)
const tree = StandardMerkleTree.StandardMerkleTree.of(values, ["address", "uint256"]);
console.log(tree.getProof(1))
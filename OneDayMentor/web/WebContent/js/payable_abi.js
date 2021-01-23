testAbi = {
  "contractName": "Test",
  "abi": [
    {
      "anonymous": false,
      "inputs": [],
      "name": "check",
      "type": "event"
    },
    {
      "constant": false,
      "inputs": [
        {
          "name": "m",
          "type": "uint256"
        }
      ],
      "name": "send",
      "outputs": [],
      "payable": true,
      "stateMutability": "payable",
      "type": "function"
    },
    {
      "constant": false,
      "inputs": [
        {
          "name": "to",
          "type": "address"
        },
        {
          "name": "m",
          "type": "uint256"
        }
      ],
      "name": "back",
      "outputs": [],
      "payable": true,
      "stateMutability": "payable",
      "type": "function"
    }
  ],
  "metadata": "{\"compiler\":{\"version\":\"0.5.8+commit.23d335f2\"},\"language\":\"Solidity\",\"output\":{\"abi\":[{\"constant\":false,\"inputs\":[{\"name\":\"m\",\"type\":\"uint256\"}],\"name\":\"send\",\"outputs\":[],\"payable\":true,\"stateMutability\":\"payable\",\"type\":\"function\"},{\"constant\":false,\"inputs\":[{\"name\":\"to\",\"type\":\"address\"},{\"name\":\"m\",\"type\":\"uint256\"}],\"name\":\"back\",\"outputs\":[],\"payable\":true,\"stateMutability\":\"payable\",\"type\":\"function\"},{\"anonymous\":false,\"inputs\":[],\"name\":\"check\",\"type\":\"event\"}],\"devdoc\":{\"methods\":{}},\"userdoc\":{\"methods\":{}}},\"settings\":{\"compilationTarget\":{\"/C/project/event/contracts/cont.sol\":\"Test\"},\"evmVersion\":\"petersburg\",\"libraries\":{},\"optimizer\":{\"enabled\":false,\"runs\":200},\"remappings\":[]},\"sources\":{\"/C/project/event/contracts/cont.sol\":{\"keccak256\":\"0x48117a8a6bf8b9ee8dff2dfbdd9f5fd9dd22c8eb1da44a6183dad7972b7c64e6\",\"urls\":[\"bzzr://bc67a7a9d8dbd79bfb1a47f36805984cc9a250380641042aad03bdd4e3e74c0d\"]}},\"version\":1}",
  "bytecode": "0x608060405260026000806101000a81548163ffffffff021916908363ffffffff16021790555034801561003157600080fd5b506101c8806100416000396000f3fe6080604052600436106100295760003560e01c8063a52c101e1461002e578063b870f6131461005c575b600080fd5b61005a6004803603602081101561004457600080fd5b81019080803590602001909291905050506100aa565b005b6100a86004803603604081101561007257600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506100e5565b005b8034146100b657600080fd5b7f919840ad4e90435c773b1fd00f34439354a8d84663bfcfb520e0b0b3b030fe6b60405160405180910390a150565b81600260006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555080600181905550600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166108fc6001549081150290604051600060405180830381858888f19350505050158015610197573d6000803e3d6000fd5b50505056fea165627a7a723058202f5b49449089cf7bd7163bb4619b8dabd7639d854be3670fd8b2427c53ba544e0029",
  "deployedBytecode": "0x6080604052600436106100295760003560e01c8063a52c101e1461002e578063b870f6131461005c575b600080fd5b61005a6004803603602081101561004457600080fd5b81019080803590602001909291905050506100aa565b005b6100a86004803603604081101561007257600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506100e5565b005b8034146100b657600080fd5b7f919840ad4e90435c773b1fd00f34439354a8d84663bfcfb520e0b0b3b030fe6b60405160405180910390a150565b81600260006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555080600181905550600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166108fc6001549081150290604051600060405180830381858888f19350505050158015610197573d6000803e3d6000fd5b50505056fea165627a7a723058202f5b49449089cf7bd7163bb4619b8dabd7639d854be3670fd8b2427c53ba544e0029",
  "sourceMap": "27:424:1:-;;;65:1;52:14;;;;;;;;;;;;;;;;;;;;27:424;8:9:-1;5:2;;;30:1;27;20:12;5:2;27:424:1;;;;;;;",
  "deployedSourceMap": "27:424:1:-;;;;;;;;;;;;;;;;;;;;;;;;;;166:114;;;;;;13:2:-1;8:3;5:11;2:2;;;29:1;26;19:12;2:2;166:114:1;;;;;;;;;;;;;;;;;:::i;:::-;;290:158;;;;;;13:2:-1;8:3;5:11;2:2;;;29:1;26;19:12;2:2;290:158:1;;;;;;;;;;;;;;;;;;;;;;;;;;;;:::i;:::-;;166:114;237:1;226:9;:12;218:21;;;;;;260:7;;;;;;;;;;166:114;:::o;290:158::-;370:2;362:7;;:10;;;;;;;;;;;;;;;;;;395:1;389:5;:7;;;;413;;;;;;;;;;;:16;;:23;430:5;;413:23;;;;;;;;;;;;;;;;;;;;;;;;8:9:-1;5:2;;;45:16;42:1;39;24:38;77:16;74:1;67:27;5:2;413:23:1;290:158;;:::o",
  "source": "pragma solidity ^0.5.8;\r\n\r\ncontract Test {\r\n        uint32 num = 2;\r\n        uint money;\r\n        address payable account;\r\n        event check();\r\n        \r\n        function send(uint m) public payable {\r\n            require(msg.value==m);\r\n             emit check(); \r\n        }\r\n        function back(address payable to,uint m) public payable{\r\n              account=to;\r\n              money=m;\r\n              account.transfer(돈);\r\n        }\r\n}",
  "sourcePath": "C:/project/event/contracts/cont.sol",
  "ast": {
    "absolutePath": "/C/project/event/contracts/cont.sol",
    "exportedSymbols": {
      "Test": [
        106
      ]
    },
    "id": 107,
    "nodeType": "SourceUnit",
    "nodes": [
      {
        "id": 58,
        "literals": [
          "solidity",
          "^",
          "0.5",
          ".8"
        ],
        "nodeType": "PragmaDirective",
        "src": "0:23:1"
      },
      {
        "baseContracts": [],
        "contractDependencies": [],
        "contractKind": "contract",
        "documentation": null,
        "fullyImplemented": true,
        "id": 106,
        "linearizedBaseContracts": [
          106
        ],
        "name": "Test",
        "nodeType": "ContractDefinition",
        "nodes": [
          {
            "constant": false,
            "id": 61,
            "name": "num",
            "nodeType": "VariableDeclaration",
            "scope": 106,
            "src": "52:14:1",
            "stateVariable": true,
            "storageLocation": "default",
            "typeDescriptions": {
              "typeIdentifier": "t_uint32",
              "typeString": "uint32"
            },
            "typeName": {
              "id": 59,
              "name": "uint32",
              "nodeType": "ElementaryTypeName",
              "src": "52:6:1",
              "typeDescriptions": {
                "typeIdentifier": "t_uint32",
                "typeString": "uint32"
              }
            },
            "value": {
              "argumentTypes": null,
              "hexValue": "32",
              "id": 60,
              "isConstant": false,
              "isLValue": false,
              "isPure": true,
              "kind": "number",
              "lValueRequested": false,
              "nodeType": "Literal",
              "src": "65:1:1",
              "subdenomination": null,
              "typeDescriptions": {
                "typeIdentifier": "t_rational_2_by_1",
                "typeString": "int_const 2"
              },
              "value": "2"
            },
            "visibility": "internal"
          },
          {
            "constant": false,
            "id": 63,
            "name": "money",
            "nodeType": "VariableDeclaration",
            "scope": 106,
            "src": "77:10:1",
            "stateVariable": true,
            "storageLocation": "default",
            "typeDescriptions": {
              "typeIdentifier": "t_uint256",
              "typeString": "uint256"
            },
            "typeName": {
              "id": 62,
              "name": "uint",
              "nodeType": "ElementaryTypeName",
              "src": "77:4:1",
              "typeDescriptions": {
                "typeIdentifier": "t_uint256",
                "typeString": "uint256"
              }
            },
            "value": null,
            "visibility": "internal"
          },
          {
            "constant": false,
            "id": 65,
            "name": "account",
            "nodeType": "VariableDeclaration",
            "scope": 106,
            "src": "98:23:1",
            "stateVariable": true,
            "storageLocation": "default",
            "typeDescriptions": {
              "typeIdentifier": "t_address_payable",
              "typeString": "address payable"
            },
            "typeName": {
              "id": 64,
              "name": "address",
              "nodeType": "ElementaryTypeName",
              "src": "98:15:1",
              "stateMutability": "payable",
              "typeDescriptions": {
                "typeIdentifier": "t_address_payable",
                "typeString": "address payable"
              }
            },
            "value": null,
            "visibility": "internal"
          },
          {
            "anonymous": false,
            "documentation": null,
            "id": 67,
            "name": "check",
            "nodeType": "EventDefinition",
            "parameters": {
              "id": 66,
              "nodeType": "ParameterList",
              "parameters": [],
              "src": "143:2:1"
            },
            "src": "132:14:1"
          },
          {
            "body": {
              "id": 82,
              "nodeType": "Block",
              "src": "203:77:1",
              "statements": [
                {
                  "expression": {
                    "argumentTypes": null,
                    "arguments": [
                      {
                        "argumentTypes": null,
                        "commonType": {
                          "typeIdentifier": "t_uint256",
                          "typeString": "uint256"
                        },
                        "id": 76,
                        "isConstant": false,
                        "isLValue": false,
                        "isPure": false,
                        "lValueRequested": false,
                        "leftExpression": {
                          "argumentTypes": null,
                          "expression": {
                            "argumentTypes": null,
                            "id": 73,
                            "name": "msg",
                            "nodeType": "Identifier",
                            "overloadedDeclarations": [],
                            "referencedDeclaration": 121,
                            "src": "226:3:1",
                            "typeDescriptions": {
                              "typeIdentifier": "t_magic_message",
                              "typeString": "msg"
                            }
                          },
                          "id": 74,
                          "isConstant": false,
                          "isLValue": false,
                          "isPure": false,
                          "lValueRequested": false,
                          "memberName": "value",
                          "nodeType": "MemberAccess",
                          "referencedDeclaration": null,
                          "src": "226:9:1",
                          "typeDescriptions": {
                            "typeIdentifier": "t_uint256",
                            "typeString": "uint256"
                          }
                        },
                        "nodeType": "BinaryOperation",
                        "operator": "==",
                        "rightExpression": {
                          "argumentTypes": null,
                          "id": 75,
                          "name": "m",
                          "nodeType": "Identifier",
                          "overloadedDeclarations": [],
                          "referencedDeclaration": 69,
                          "src": "237:1:1",
                          "typeDescriptions": {
                            "typeIdentifier": "t_uint256",
                            "typeString": "uint256"
                          }
                        },
                        "src": "226:12:1",
                        "typeDescriptions": {
                          "typeIdentifier": "t_bool",
                          "typeString": "bool"
                        }
                      }
                    ],
                    "expression": {
                      "argumentTypes": [
                        {
                          "typeIdentifier": "t_bool",
                          "typeString": "bool"
                        }
                      ],
                      "id": 72,
                      "name": "require",
                      "nodeType": "Identifier",
                      "overloadedDeclarations": [
                        124,
                        125
                      ],
                      "referencedDeclaration": 124,
                      "src": "218:7:1",
                      "typeDescriptions": {
                        "typeIdentifier": "t_function_require_pure$_t_bool_$returns$__$",
                        "typeString": "function (bool) pure"
                      }
                    },
                    "id": 77,
                    "isConstant": false,
                    "isLValue": false,
                    "isPure": false,
                    "kind": "functionCall",
                    "lValueRequested": false,
                    "names": [],
                    "nodeType": "FunctionCall",
                    "src": "218:21:1",
                    "typeDescriptions": {
                      "typeIdentifier": "t_tuple$__$",
                      "typeString": "tuple()"
                    }
                  },
                  "id": 78,
                  "nodeType": "ExpressionStatement",
                  "src": "218:21:1"
                },
                {
                  "eventCall": {
                    "argumentTypes": null,
                    "arguments": [],
                    "expression": {
                      "argumentTypes": [],
                      "id": 79,
                      "name": "check",
                      "nodeType": "Identifier",
                      "overloadedDeclarations": [],
                      "referencedDeclaration": 67,
                      "src": "260:5:1",
                      "typeDescriptions": {
                        "typeIdentifier": "t_function_event_nonpayable$__$returns$__$",
                        "typeString": "function ()"
                      }
                    },
                    "id": 80,
                    "isConstant": false,
                    "isLValue": false,
                    "isPure": false,
                    "kind": "functionCall",
                    "lValueRequested": false,
                    "names": [],
                    "nodeType": "FunctionCall",
                    "src": "260:7:1",
                    "typeDescriptions": {
                      "typeIdentifier": "t_tuple$__$",
                      "typeString": "tuple()"
                    }
                  },
                  "id": 81,
                  "nodeType": "EmitStatement",
                  "src": "255:12:1"
                }
              ]
            },
            "documentation": null,
            "id": 83,
            "implemented": true,
            "kind": "function",
            "modifiers": [],
            "name": "send",
            "nodeType": "FunctionDefinition",
            "parameters": {
              "id": 70,
              "nodeType": "ParameterList",
              "parameters": [
                {
                  "constant": false,
                  "id": 69,
                  "name": "m",
                  "nodeType": "VariableDeclaration",
                  "scope": 83,
                  "src": "180:6:1",
                  "stateVariable": false,
                  "storageLocation": "default",
                  "typeDescriptions": {
                    "typeIdentifier": "t_uint256",
                    "typeString": "uint256"
                  },
                  "typeName": {
                    "id": 68,
                    "name": "uint",
                    "nodeType": "ElementaryTypeName",
                    "src": "180:4:1",
                    "typeDescriptions": {
                      "typeIdentifier": "t_uint256",
                      "typeString": "uint256"
                    }
                  },
                  "value": null,
                  "visibility": "internal"
                }
              ],
              "src": "179:8:1"
            },
            "returnParameters": {
              "id": 71,
              "nodeType": "ParameterList",
              "parameters": [],
              "src": "203:0:1"
            },
            "scope": 106,
            "src": "166:114:1",
            "stateMutability": "payable",
            "superFunction": null,
            "visibility": "public"
          },
          {
            "body": {
              "id": 104,
              "nodeType": "Block",
              "src": "345:103:1",
              "statements": [
                {
                  "expression": {
                    "argumentTypes": null,
                    "id": 92,
                    "isConstant": false,
                    "isLValue": false,
                    "isPure": false,
                    "lValueRequested": false,
                    "leftHandSide": {
                      "argumentTypes": null,
                      "id": 90,
                      "name": "account",
                      "nodeType": "Identifier",
                      "overloadedDeclarations": [],
                      "referencedDeclaration": 65,
                      "src": "362:7:1",
                      "typeDescriptions": {
                        "typeIdentifier": "t_address_payable",
                        "typeString": "address payable"
                      }
                    },
                    "nodeType": "Assignment",
                    "operator": "=",
                    "rightHandSide": {
                      "argumentTypes": null,
                      "id": 91,
                      "name": "to",
                      "nodeType": "Identifier",
                      "overloadedDeclarations": [],
                      "referencedDeclaration": 85,
                      "src": "370:2:1",
                      "typeDescriptions": {
                        "typeIdentifier": "t_address_payable",
                        "typeString": "address payable"
                      }
                    },
                    "src": "362:10:1",
                    "typeDescriptions": {
                      "typeIdentifier": "t_address_payable",
                      "typeString": "address payable"
                    }
                  },
                  "id": 93,
                  "nodeType": "ExpressionStatement",
                  "src": "362:10:1"
                },
                {
                  "expression": {
                    "argumentTypes": null,
                    "id": 96,
                    "isConstant": false,
                    "isLValue": false,
                    "isPure": false,
                    "lValueRequested": false,
                    "leftHandSide": {
                      "argumentTypes": null,
                      "id": 94,
                      "name": "money",
                      "nodeType": "Identifier",
                      "overloadedDeclarations": [],
                      "referencedDeclaration": 63,
                      "src": "389:5:1",
                      "typeDescriptions": {
                        "typeIdentifier": "t_uint256",
                        "typeString": "uint256"
                      }
                    },
                    "nodeType": "Assignment",
                    "operator": "=",
                    "rightHandSide": {
                      "argumentTypes": null,
                      "id": 95,
                      "name": "m",
                      "nodeType": "Identifier",
                      "overloadedDeclarations": [],
                      "referencedDeclaration": 87,
                      "src": "395:1:1",
                      "typeDescriptions": {
                        "typeIdentifier": "t_uint256",
                        "typeString": "uint256"
                      }
                    },
                    "src": "389:7:1",
                    "typeDescriptions": {
                      "typeIdentifier": "t_uint256",
                      "typeString": "uint256"
                    }
                  },
                  "id": 97,
                  "nodeType": "ExpressionStatement",
                  "src": "389:7:1"
                },
                {
                  "expression": {
                    "argumentTypes": null,
                    "arguments": [
                      {
                        "argumentTypes": null,
                        "id": 101,
                        "name": "money",
                        "nodeType": "Identifier",
                        "overloadedDeclarations": [],
                        "referencedDeclaration": 63,
                        "src": "430:5:1",
                        "typeDescriptions": {
                          "typeIdentifier": "t_uint256",
                          "typeString": "uint256"
                        }
                      }
                    ],
                    "expression": {
                      "argumentTypes": [
                        {
                          "typeIdentifier": "t_uint256",
                          "typeString": "uint256"
                        }
                      ],
                      "expression": {
                        "argumentTypes": null,
                        "id": 98,
                        "name": "account",
                        "nodeType": "Identifier",
                        "overloadedDeclarations": [],
                        "referencedDeclaration": 65,
                        "src": "413:7:1",
                        "typeDescriptions": {
                          "typeIdentifier": "t_address_payable",
                          "typeString": "address payable"
                        }
                      },
                      "id": 100,
                      "isConstant": false,
                      "isLValue": false,
                      "isPure": false,
                      "lValueRequested": false,
                      "memberName": "transfer",
                      "nodeType": "MemberAccess",
                      "referencedDeclaration": null,
                      "src": "413:16:1",
                      "typeDescriptions": {
                        "typeIdentifier": "t_function_transfer_nonpayable$_t_uint256_$returns$__$",
                        "typeString": "function (uint256)"
                      }
                    },
                    "id": 102,
                    "isConstant": false,
                    "isLValue": false,
                    "isPure": false,
                    "kind": "functionCall",
                    "lValueRequested": false,
                    "names": [],
                    "nodeType": "FunctionCall",
                    "src": "413:23:1",
                    "typeDescriptions": {
                      "typeIdentifier": "t_tuple$__$",
                      "typeString": "tuple()"
                    }
                  },
                  "id": 103,
                  "nodeType": "ExpressionStatement",
                  "src": "413:23:1"
                }
              ]
            },
            "documentation": null,
            "id": 105,
            "implemented": true,
            "kind": "function",
            "modifiers": [],
            "name": "back",
            "nodeType": "FunctionDefinition",
            "parameters": {
              "id": 88,
              "nodeType": "ParameterList",
              "parameters": [
                {
                  "constant": false,
                  "id": 85,
                  "name": "to",
                  "nodeType": "VariableDeclaration",
                  "scope": 105,
                  "src": "304:18:1",
                  "stateVariable": false,
                  "storageLocation": "default",
                  "typeDescriptions": {
                    "typeIdentifier": "t_address_payable",
                    "typeString": "address payable"
                  },
                  "typeName": {
                    "id": 84,
                    "name": "address",
                    "nodeType": "ElementaryTypeName",
                    "src": "304:15:1",
                    "stateMutability": "payable",
                    "typeDescriptions": {
                      "typeIdentifier": "t_address_payable",
                      "typeString": "address payable"
                    }
                  },
                  "value": null,
                  "visibility": "internal"
                },
                {
                  "constant": false,
                  "id": 87,
                  "name": "m",
                  "nodeType": "VariableDeclaration",
                  "scope": 105,
                  "src": "323:6:1",
                  "stateVariable": false,
                  "storageLocation": "default",
                  "typeDescriptions": {
                    "typeIdentifier": "t_uint256",
                    "typeString": "uint256"
                  },
                  "typeName": {
                    "id": 86,
                    "name": "uint",
                    "nodeType": "ElementaryTypeName",
                    "src": "323:4:1",
                    "typeDescriptions": {
                      "typeIdentifier": "t_uint256",
                      "typeString": "uint256"
                    }
                  },
                  "value": null,
                  "visibility": "internal"
                }
              ],
              "src": "303:27:1"
            },
            "returnParameters": {
              "id": 89,
              "nodeType": "ParameterList",
              "parameters": [],
              "src": "345:0:1"
            },
            "scope": 106,
            "src": "290:158:1",
            "stateMutability": "payable",
            "superFunction": null,
            "visibility": "public"
          }
        ],
        "scope": 107,
        "src": "27:424:1"
      }
    ],
    "src": "0:451:1"
  },
  "legacyAST": {
    "absolutePath": "/C/project/event/contracts/cont.sol",
    "exportedSymbols": {
      "Test": [
        106
      ]
    },
    "id": 107,
    "nodeType": "SourceUnit",
    "nodes": [
      {
        "id": 58,
        "literals": [
          "solidity",
          "^",
          "0.5",
          ".8"
        ],
        "nodeType": "PragmaDirective",
        "src": "0:23:1"
      },
      {
        "baseContracts": [],
        "contractDependencies": [],
        "contractKind": "contract",
        "documentation": null,
        "fullyImplemented": true,
        "id": 106,
        "linearizedBaseContracts": [
          106
        ],
        "name": "Test",
        "nodeType": "ContractDefinition",
        "nodes": [
          {
            "constant": false,
            "id": 61,
            "name": "num",
            "nodeType": "VariableDeclaration",
            "scope": 106,
            "src": "52:14:1",
            "stateVariable": true,
            "storageLocation": "default",
            "typeDescriptions": {
              "typeIdentifier": "t_uint32",
              "typeString": "uint32"
            },
            "typeName": {
              "id": 59,
              "name": "uint32",
              "nodeType": "ElementaryTypeName",
              "src": "52:6:1",
              "typeDescriptions": {
                "typeIdentifier": "t_uint32",
                "typeString": "uint32"
              }
            },
            "value": {
              "argumentTypes": null,
              "hexValue": "32",
              "id": 60,
              "isConstant": false,
              "isLValue": false,
              "isPure": true,
              "kind": "number",
              "lValueRequested": false,
              "nodeType": "Literal",
              "src": "65:1:1",
              "subdenomination": null,
              "typeDescriptions": {
                "typeIdentifier": "t_rational_2_by_1",
                "typeString": "int_const 2"
              },
              "value": "2"
            },
            "visibility": "internal"
          },
          {
            "constant": false,
            "id": 63,
            "name": "money",
            "nodeType": "VariableDeclaration",
            "scope": 106,
            "src": "77:10:1",
            "stateVariable": true,
            "storageLocation": "default",
            "typeDescriptions": {
              "typeIdentifier": "t_uint256",
              "typeString": "uint256"
            },
            "typeName": {
              "id": 62,
              "name": "uint",
              "nodeType": "ElementaryTypeName",
              "src": "77:4:1",
              "typeDescriptions": {
                "typeIdentifier": "t_uint256",
                "typeString": "uint256"
              }
            },
            "value": null,
            "visibility": "internal"
          },
          {
            "constant": false,
            "id": 65,
            "name": "account",
            "nodeType": "VariableDeclaration",
            "scope": 106,
            "src": "98:23:1",
            "stateVariable": true,
            "storageLocation": "default",
            "typeDescriptions": {
              "typeIdentifier": "t_address_payable",
              "typeString": "address payable"
            },
            "typeName": {
              "id": 64,
              "name": "address",
              "nodeType": "ElementaryTypeName",
              "src": "98:15:1",
              "stateMutability": "payable",
              "typeDescriptions": {
                "typeIdentifier": "t_address_payable",
                "typeString": "address payable"
              }
            },
            "value": null,
            "visibility": "internal"
          },
          {
            "anonymous": false,
            "documentation": null,
            "id": 67,
            "name": "check",
            "nodeType": "EventDefinition",
            "parameters": {
              "id": 66,
              "nodeType": "ParameterList",
              "parameters": [],
              "src": "143:2:1"
            },
            "src": "132:14:1"
          },
          {
            "body": {
              "id": 82,
              "nodeType": "Block",
              "src": "203:77:1",
              "statements": [
                {
                  "expression": {
                    "argumentTypes": null,
                    "arguments": [
                      {
                        "argumentTypes": null,
                        "commonType": {
                          "typeIdentifier": "t_uint256",
                          "typeString": "uint256"
                        },
                        "id": 76,
                        "isConstant": false,
                        "isLValue": false,
                        "isPure": false,
                        "lValueRequested": false,
                        "leftExpression": {
                          "argumentTypes": null,
                          "expression": {
                            "argumentTypes": null,
                            "id": 73,
                            "name": "msg",
                            "nodeType": "Identifier",
                            "overloadedDeclarations": [],
                            "referencedDeclaration": 121,
                            "src": "226:3:1",
                            "typeDescriptions": {
                              "typeIdentifier": "t_magic_message",
                              "typeString": "msg"
                            }
                          },
                          "id": 74,
                          "isConstant": false,
                          "isLValue": false,
                          "isPure": false,
                          "lValueRequested": false,
                          "memberName": "value",
                          "nodeType": "MemberAccess",
                          "referencedDeclaration": null,
                          "src": "226:9:1",
                          "typeDescriptions": {
                            "typeIdentifier": "t_uint256",
                            "typeString": "uint256"
                          }
                        },
                        "nodeType": "BinaryOperation",
                        "operator": "==",
                        "rightExpression": {
                          "argumentTypes": null,
                          "id": 75,
                          "name": "m",
                          "nodeType": "Identifier",
                          "overloadedDeclarations": [],
                          "referencedDeclaration": 69,
                          "src": "237:1:1",
                          "typeDescriptions": {
                            "typeIdentifier": "t_uint256",
                            "typeString": "uint256"
                          }
                        },
                        "src": "226:12:1",
                        "typeDescriptions": {
                          "typeIdentifier": "t_bool",
                          "typeString": "bool"
                        }
                      }
                    ],
                    "expression": {
                      "argumentTypes": [
                        {
                          "typeIdentifier": "t_bool",
                          "typeString": "bool"
                        }
                      ],
                      "id": 72,
                      "name": "require",
                      "nodeType": "Identifier",
                      "overloadedDeclarations": [
                        124,
                        125
                      ],
                      "referencedDeclaration": 124,
                      "src": "218:7:1",
                      "typeDescriptions": {
                        "typeIdentifier": "t_function_require_pure$_t_bool_$returns$__$",
                        "typeString": "function (bool) pure"
                      }
                    },
                    "id": 77,
                    "isConstant": false,
                    "isLValue": false,
                    "isPure": false,
                    "kind": "functionCall",
                    "lValueRequested": false,
                    "names": [],
                    "nodeType": "FunctionCall",
                    "src": "218:21:1",
                    "typeDescriptions": {
                      "typeIdentifier": "t_tuple$__$",
                      "typeString": "tuple()"
                    }
                  },
                  "id": 78,
                  "nodeType": "ExpressionStatement",
                  "src": "218:21:1"
                },
                {
                  "eventCall": {
                    "argumentTypes": null,
                    "arguments": [],
                    "expression": {
                      "argumentTypes": [],
                      "id": 79,
                      "name": "check",
                      "nodeType": "Identifier",
                      "overloadedDeclarations": [],
                      "referencedDeclaration": 67,
                      "src": "260:5:1",
                      "typeDescriptions": {
                        "typeIdentifier": "t_function_event_nonpayable$__$returns$__$",
                        "typeString": "function ()"
                      }
                    },
                    "id": 80,
                    "isConstant": false,
                    "isLValue": false,
                    "isPure": false,
                    "kind": "functionCall",
                    "lValueRequested": false,
                    "names": [],
                    "nodeType": "FunctionCall",
                    "src": "260:7:1",
                    "typeDescriptions": {
                      "typeIdentifier": "t_tuple$__$",
                      "typeString": "tuple()"
                    }
                  },
                  "id": 81,
                  "nodeType": "EmitStatement",
                  "src": "255:12:1"
                }
              ]
            },
            "documentation": null,
            "id": 83,
            "implemented": true,
            "kind": "function",
            "modifiers": [],
            "name": "send",
            "nodeType": "FunctionDefinition",
            "parameters": {
              "id": 70,
              "nodeType": "ParameterList",
              "parameters": [
                {
                  "constant": false,
                  "id": 69,
                  "name": "m",
                  "nodeType": "VariableDeclaration",
                  "scope": 83,
                  "src": "180:6:1",
                  "stateVariable": false,
                  "storageLocation": "default",
                  "typeDescriptions": {
                    "typeIdentifier": "t_uint256",
                    "typeString": "uint256"
                  },
                  "typeName": {
                    "id": 68,
                    "name": "uint",
                    "nodeType": "ElementaryTypeName",
                    "src": "180:4:1",
                    "typeDescriptions": {
                      "typeIdentifier": "t_uint256",
                      "typeString": "uint256"
                    }
                  },
                  "value": null,
                  "visibility": "internal"
                }
              ],
              "src": "179:8:1"
            },
            "returnParameters": {
              "id": 71,
              "nodeType": "ParameterList",
              "parameters": [],
              "src": "203:0:1"
            },
            "scope": 106,
            "src": "166:114:1",
            "stateMutability": "payable",
            "superFunction": null,
            "visibility": "public"
          },
          {
            "body": {
              "id": 104,
              "nodeType": "Block",
              "src": "345:103:1",
              "statements": [
                {
                  "expression": {
                    "argumentTypes": null,
                    "id": 92,
                    "isConstant": false,
                    "isLValue": false,
                    "isPure": false,
                    "lValueRequested": false,
                    "leftHandSide": {
                      "argumentTypes": null,
                      "id": 90,
                      "name": "account",
                      "nodeType": "Identifier",
                      "overloadedDeclarations": [],
                      "referencedDeclaration": 65,
                      "src": "362:7:1",
                      "typeDescriptions": {
                        "typeIdentifier": "t_address_payable",
                        "typeString": "address payable"
                      }
                    },
                    "nodeType": "Assignment",
                    "operator": "=",
                    "rightHandSide": {
                      "argumentTypes": null,
                      "id": 91,
                      "name": "to",
                      "nodeType": "Identifier",
                      "overloadedDeclarations": [],
                      "referencedDeclaration": 85,
                      "src": "370:2:1",
                      "typeDescriptions": {
                        "typeIdentifier": "t_address_payable",
                        "typeString": "address payable"
                      }
                    },
                    "src": "362:10:1",
                    "typeDescriptions": {
                      "typeIdentifier": "t_address_payable",
                      "typeString": "address payable"
                    }
                  },
                  "id": 93,
                  "nodeType": "ExpressionStatement",
                  "src": "362:10:1"
                },
                {
                  "expression": {
                    "argumentTypes": null,
                    "id": 96,
                    "isConstant": false,
                    "isLValue": false,
                    "isPure": false,
                    "lValueRequested": false,
                    "leftHandSide": {
                      "argumentTypes": null,
                      "id": 94,
                      "name": "money",
                      "nodeType": "Identifier",
                      "overloadedDeclarations": [],
                      "referencedDeclaration": 63,
                      "src": "389:5:1",
                      "typeDescriptions": {
                        "typeIdentifier": "t_uint256",
                        "typeString": "uint256"
                      }
                    },
                    "nodeType": "Assignment",
                    "operator": "=",
                    "rightHandSide": {
                      "argumentTypes": null,
                      "id": 95,
                      "name": "m",
                      "nodeType": "Identifier",
                      "overloadedDeclarations": [],
                      "referencedDeclaration": 87,
                      "src": "395:1:1",
                      "typeDescriptions": {
                        "typeIdentifier": "t_uint256",
                        "typeString": "uint256"
                      }
                    },
                    "src": "389:7:1",
                    "typeDescriptions": {
                      "typeIdentifier": "t_uint256",
                      "typeString": "uint256"
                    }
                  },
                  "id": 97,
                  "nodeType": "ExpressionStatement",
                  "src": "389:7:1"
                },
                {
                  "expression": {
                    "argumentTypes": null,
                    "arguments": [
                      {
                        "argumentTypes": null,
                        "id": 101,
                        "name": "money",
                        "nodeType": "Identifier",
                        "overloadedDeclarations": [],
                        "referencedDeclaration": 63,
                        "src": "430:5:1",
                        "typeDescriptions": {
                          "typeIdentifier": "t_uint256",
                          "typeString": "uint256"
                        }
                      }
                    ],
                    "expression": {
                      "argumentTypes": [
                        {
                          "typeIdentifier": "t_uint256",
                          "typeString": "uint256"
                        }
                      ],
                      "expression": {
                        "argumentTypes": null,
                        "id": 98,
                        "name": "account",
                        "nodeType": "Identifier",
                        "overloadedDeclarations": [],
                        "referencedDeclaration": 65,
                        "src": "413:7:1",
                        "typeDescriptions": {
                          "typeIdentifier": "t_address_payable",
                          "typeString": "address payable"
                        }
                      },
                      "id": 100,
                      "isConstant": false,
                      "isLValue": false,
                      "isPure": false,
                      "lValueRequested": false,
                      "memberName": "transfer",
                      "nodeType": "MemberAccess",
                      "referencedDeclaration": null,
                      "src": "413:16:1",
                      "typeDescriptions": {
                        "typeIdentifier": "t_function_transfer_nonpayable$_t_uint256_$returns$__$",
                        "typeString": "function (uint256)"
                      }
                    },
                    "id": 102,
                    "isConstant": false,
                    "isLValue": false,
                    "isPure": false,
                    "kind": "functionCall",
                    "lValueRequested": false,
                    "names": [],
                    "nodeType": "FunctionCall",
                    "src": "413:23:1",
                    "typeDescriptions": {
                      "typeIdentifier": "t_tuple$__$",
                      "typeString": "tuple()"
                    }
                  },
                  "id": 103,
                  "nodeType": "ExpressionStatement",
                  "src": "413:23:1"
                }
              ]
            },
            "documentation": null,
            "id": 105,
            "implemented": true,
            "kind": "function",
            "modifiers": [],
            "name": "back",
            "nodeType": "FunctionDefinition",
            "parameters": {
              "id": 88,
              "nodeType": "ParameterList",
              "parameters": [
                {
                  "constant": false,
                  "id": 85,
                  "name": "to",
                  "nodeType": "VariableDeclaration",
                  "scope": 105,
                  "src": "304:18:1",
                  "stateVariable": false,
                  "storageLocation": "default",
                  "typeDescriptions": {
                    "typeIdentifier": "t_address_payable",
                    "typeString": "address payable"
                  },
                  "typeName": {
                    "id": 84,
                    "name": "address",
                    "nodeType": "ElementaryTypeName",
                    "src": "304:15:1",
                    "stateMutability": "payable",
                    "typeDescriptions": {
                      "typeIdentifier": "t_address_payable",
                      "typeString": "address payable"
                    }
                  },
                  "value": null,
                  "visibility": "internal"
                },
                {
                  "constant": false,
                  "id": 87,
                  "name": "m",
                  "nodeType": "VariableDeclaration",
                  "scope": 105,
                  "src": "323:6:1",
                  "stateVariable": false,
                  "storageLocation": "default",
                  "typeDescriptions": {
                    "typeIdentifier": "t_uint256",
                    "typeString": "uint256"
                  },
                  "typeName": {
                    "id": 86,
                    "name": "uint",
                    "nodeType": "ElementaryTypeName",
                    "src": "323:4:1",
                    "typeDescriptions": {
                      "typeIdentifier": "t_uint256",
                      "typeString": "uint256"
                    }
                  },
                  "value": null,
                  "visibility": "internal"
                }
              ],
              "src": "303:27:1"
            },
            "returnParameters": {
              "id": 89,
              "nodeType": "ParameterList",
              "parameters": [],
              "src": "345:0:1"
            },
            "scope": 106,
            "src": "290:158:1",
            "stateMutability": "payable",
            "superFunction": null,
            "visibility": "public"
          }
        ],
        "scope": 107,
        "src": "27:424:1"
      }
    ],
    "src": "0:451:1"
  },
  "compiler": {
    "name": "solc",
    "version": "0.5.8+commit.23d335f2.Emscripten.clang"
  },
  "networks": {
    "3": {
      "events": {},
      "links": {},
      "address": "0x561558484085b0d2432C15557cbF83C4B34c4556",
      "transactionHash": "0x0a95cf66c114fba004416b2363913ea1d2fbaef102c382b2079efaed8bc441b6"
    }
  },
  "schemaVersion": "3.0.11",
  "updatedAt": "2019-08-28T06:01:33.398Z",
  "devdoc": {
    "methods": {}
  },
  "userdoc": {
    "methods": {}
  }
}
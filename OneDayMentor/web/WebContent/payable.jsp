<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script lang="javascript" type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script lang="javascript" type="test/javascript" src="js/web3.min.js"></script>
<script lang="javascript" type="text/javascript" src="js/payable_abi.js"></script>
</head>
<body>
   <form>
      <input type="text" id="ConnTxt">
      <input type="button" id="Connbtn" value="연결하기">
   </form>
   
   <script>
         var test;
        
         document.getElementById('Connbtn').onclick=function(){
            var testAddress = '0x6a6A95Be9918DbccF9333f771C34EE3d5f89cf92' // 컨트랙트 주소
            test = web3js.eth.contract(testAbi.abi).at(testAddress); // 컨트랙트 객체 생성
            
            var userAddress;
            window.ethereum.enable();
            
            web3js.eth.getAccounts(function(err, result) {
               if(err!=null)
                  console.log("크롬, 메타마스크 이용");
               if(result.length==0)
                  console.log("메타마스크 로그인 필요");
               else {
                  userAddress = result.toString();
                  console.log(userAddress);
                  
                  test.send.sendTransaction('0xBe13CDE7eAFC2fe07737733eEf6977b68f8868dD',{from: userAddress ,to: testAddress ,value: web3js.toWei(0.1)} , function(error, transactionHash){    // set() 호출
                    if(!error)
                        console.log(transactionHash);
                    else
                        console.error(error);  
                    })
               }
            })
        }
        
         window.addEventListener('load', function() {
            // Web3가 브라우저에 주입되었는지 확인(MetaMask)
            if (typeof web3 !== 'undefined') {
               // MetaMask의 프로바이더 사용
               web3js = new Web3(web3.currentProvider);
               console.log("metamask 설치 O")
            } else {
               // 사용자가 Metamask를 설치하지 않은 경우에 대해 처리
               // 사용자들에게 Metamask를 설치하라는 등의 메세지를 보여줄 것
               console.log("metamask 설치 X");
            }
                // 접근 권한 승인
               // 앱 시작
           });
   
   </script>
   
   
</body>
</html>
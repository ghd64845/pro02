<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
   function test1(){
      var serviceKey='dt2Nu%2Bu9tgj6Kwy1XIKjBFD8Ns8Etgi2jM6AuzJpQ1Hs%2Fy3WN2RSZU8PnK3MG15kw2UPyDjHSnaBkw7GTASqHA%3D%3D'
      var reqUrl='http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?serviceKey='
            +serviceKey+'&pageNo=2&numOfRows=1&MobileApp=BTS&MobileOS=ETC&arrange=A&contentTypeId=&listYN=Y';
      $.ajax({
         async : false,
         url : reqUrl,
          dataType:'json',
         success : function (data,textStatus){
            var jsonInfo = data;                           
            console.log(data);
            var image = document.createElement('img');
            $(image).prop('src',jsonInfo.response.body.items.item.firstimage);
            $('body').append(image);
            $('#div1').append(document.createTextNode("주소 : "+jsonInfo.response.body.items.item.addr1));
            $('#div1').append(document.createElement('br'));
            $('#div1').append(document.createTextNode('장소명 : '+jsonInfo.response.body.items.item.title));
         },//end success
         error : function (data,textStatus){
            alert("에러가 발생했습니다.");
         }
      }); //end ajax
   }
</script>
</head>
<body>
   <input type="button" onclick="test1()" value="테스트">
   <div id="div1">
   </div>
</body>
</html>

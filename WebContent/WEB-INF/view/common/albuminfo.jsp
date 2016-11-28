<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <style type="text/css">
.tg  {border-collapse:collapse;border-spacing:0;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;}
.tg .tg-yw4l{vertical-align:top}
</style>
<table class="tg">
  <tr>
    <th class="tg-031e" rowspan="5"><img src="/${mp3.SAVEARTIST}${mp3.SAVETITLE}.png" style="width:300px;height:300px"></th>
    <th class="tg-yw4l" colspan="4"><h2>앨범</h2><br/> ${mp3.ALBUM}<br/></th>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="4"><h2>아티스트</h2>${mp3.ARTIST}</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="4"><h2>타이틀</h2>${mp3.TITLE}</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="4"><h2>년도</h2>${mp3.YEAR}</td>
  </tr>
  <tr>
    <td class="tg-yw4l" colspan="4"><h2>장르</h2>${mp3.GENRE}</td>
  </tr>
</table>

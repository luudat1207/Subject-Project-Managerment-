<%-- 
    Document   : testUpload
    Created on : Jun 3, 2022, 1:04:22 PM
    Author     : RxZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="/g3/services/upload" enctype="multipart/form-data">
    Select file to upload: <input type="file" size="60" name="photo" /><br /><br /> 
    <input type="submit" value="Upload" />
  </form>
    </body>
</html>

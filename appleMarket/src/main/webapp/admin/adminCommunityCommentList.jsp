<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>boardList</title>
</head>
<body>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-8"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">조잘조잘게시판 댓글 관리</h1>
            </div>
            <div class="row">
                  
              </div>
            <div class="panel panel-default">
                <div class="panel-heading">조잘조잘게시판 댓글</div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>No.1</th>
                                <th>댓글</th>
                                <th>작성자</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                       
                    </table>
                </div>
            </div>
             <!-- sidebar -->
             <%@include file="/admin/adminindex.jsp" %>
        </div>
    </div>
</div>
</body>
</html>
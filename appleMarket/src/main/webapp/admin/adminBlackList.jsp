<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<title>Black List</title>
</head>
<body>
<div class="page-wrapper">
    <div class="container-fluid">
        <div class="col-lg-9"><!--게시판 넓이 -->
            <div class="col-lg-12">
                <h1 class="page-header">Black List</h1>
            </div>
            <div class="row">
                  <div class="col-lg-12">
                       <button type="button" class="btn btn-outline btn-primary pull-right" onclick="location.href='/appleMarket/adminMemberList'">
                          <i class="fa fa-edit fa-fw"></i> 회원리스트
                      </button>
                  </div>
              </div>
              <br>
            <div class="panel panel-default">
                <div class="panel-heading">
                	<ion-icon name="remove-circle-outline"class="nav__icon"></ion-icon>
                </div>
                <div class="panel-body">
                    <table class="table table-hover" id="adminBlackList">
              				<tr>
                               <th>번호</th>
                               <th>아이디</th>
                               <th>사이트</th>
                           </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/appleMarket/js/adminBlackList.js"></script>
</body>
</html>
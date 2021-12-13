<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>신고하기</title>

    <link href="/appleMarket/css/warningboardwriteForm.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body>

    <div id="contact">
        <h1>신고하기</h1>
        <form action="#" method="post">
            <fieldset>
                <label for="name">신고사유:</label>
                <select name="language">
                    <option value="none">=== 선택 ===</option>
                    <option value="">비매너</option>
                    <option value="">욕설</option>
                    <option value="">사기</option>
                    <option value="">불법,유해</option>
                    <option value="">기타</option>
                  </select>

                <label for="message">신고내용:</label>
                <textarea id="message" placeholder="신고내용을 적어주세요."></textarea>

                <input type="submit" value="신고하기" />

            </fieldset>
        </form>
    </div>

</body>

</html>
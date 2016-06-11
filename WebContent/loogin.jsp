<%@ page contentType="text/html;charset=GB2312" %>
<!doctype html>
<html lang="en-US">
<head>

    <meta charset="utf-8">

    <title>Login</title>
    <style type="text/css">
        body {
            background-color:orange;
            color: #000;
            font-family: "Varela Round", Arial, Helvetica, sans-serif;
            font-size: 16px;
            line-height: 1.5em;
        }
        input {
            border: none;
            font-family: inherit;
            font-size: inherit;
            font-weight: inherit;
            line-height: inherit;
            -webkit-appearance: none;
        }
        #login {
            margin: 50px auto;
            width: 400px;
        }
        #login h2 {
            background-color: #f95252;
            -webkit-border-radius: 20px 20px 0 0;
            -moz-border-radius: 20px 20px 0 0;
            border-radius: 20px 20px 0 0;
            color: #fff;
            font-size: 28px;
            padding: 20px 26px;
        }
        #login h2 span[class*="fontawesome-"] {
            margin-right: 14px;
        }
        #login fieldset {
            background-color: #fff;
            -webkit-border-radius: 0 0 20px 20px;
            -moz-border-radius: 0 0 20px 20px;
            border-radius: 0 0 20px 20px;
            padding: 20px 26px;
        }
        #login fieldset p {
            color: #777;
            margin-bottom: 14px;
        }
        #login fieldset p:last-child {
            margin-bottom: 0;
        }
        #login fieldset input {
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
        }
        #login fieldset input[type="email"], #login fieldset input[type="password"] {
            background-color: #eee;
            color: #777;
            padding: 4px 10px;
            width: 328px;
        }
        #login fieldset input[type="submit"] {
            background-color: #33cc77;
            color: #fff;
            display: block;
            margin: 0 auto;
            padding: 4px 0;
            width: 100px;
        }
    </style>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Varela+Round">
</head>

<body>
<div id="login">
    <h2><span class="fontawesome-lock"></span>Sign In</h2>
    <form action="helpLoogin" method="POST">
        <fieldset>

            <p><label for="email">E-mail address</label></p>
            <p><input type="text" id="username" value="username" onBlur="if(this.value=='')this.value='username'" onFocus="if(this.value=='username')this.value=''" name="username"></p> <!-- JS because of IE support; better: placeholder="mail@address.com" -->
            <p><label for="password">Password</label></p>
            <p><input type="password" id="password" value="password" onBlur="if(this.value=='')this.value='password'" onFocus="if(this.value=='password')this.value=''" name="password"></p> <!-- JS because of IE support; better: placeholder="password" -->
            <p><input type="submit" value="Sign In"></p>

        </fieldset>
    </form>
</div> <!-- end login -->
</body>
<ml>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form method="post" action="/calculate">
    <fieldset>
        <legend>Calculator</legend>
        <table>
            <tr>
                <td>So1: </td>
                <td><input name="so1" type="text"/></td>
            </tr>
            <tr>
                <td>Operator: </td>
                <td>
                    <select name="chon">
                        <option value="+">Addition</option>
                        <option value="-">Subtraction</option>
                        <option value="*">Multiplication</option>
                        <option value="/">Division</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>So2: </td>
                <td><input name="so2" type="text"/></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Calculate"/></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
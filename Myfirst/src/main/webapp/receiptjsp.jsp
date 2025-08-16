<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receipt Preview</title>
<style>
/* Paste your receipt CSS here */
#receipt_wrapper {
    width: 100%;
}

#receipt_header {
    text-align: center;
}

#company_name {
    font-size: 150%;
    font-weight: bold;
}

#company_name img {
    max-width: 150px;
    max-height: 150px;
}

#company_phone {
    margin-bottom: 15px;
}

#sale_time {
    margin-bottom: 5px;
}

#receipt_items {
    position: relative;
    border-collapse: collapse;
    margin-top: 15px;
    margin-bottom: 15px;
    width: 100%;
}

#receipt_items td {
    position: relative;
    padding: 3px;
    margin-bottom: 5px;
}

#receipt_items tr {
    margin-bottom: 5px;
}

#sale_return_policy {
    width: 80%;
    margin: 0 auto;
    text-align: center;
}

#receipt_wrapper #barcode {
    margin-top: 10px;
    text-align: center;
}

.total-value {
    text-align: right;
}

.discount {
    font-weight: bold;
}
</style>
</head>
<body>

<div id="receipt_wrapper">

    <div id="receipt_header">
        <div id="company_name">
            <img src="https://via.placeholder.com/150" alt="Company Logo"><br>
            My Store
        </div>
        <div id="company_phone">
            +94 71 123 4567
        </div>
        <div id="sale_time">
            14-Aug-2025 3:42 PM
        </div>
    </div>

    <table id="receipt_items">
        <tr>
            <td>Item A x2</td>
            <td class="total-value">1000.00</td>
        </tr>
        <tr>
            <td>Item B x1</td>
            <td class="total-value">500.00</td>
        </tr>
        <tr>
            <td>Subtotal</td>
            <td class="total-value">1500.00</td>
        </tr>
        <tr class="discount">
            <td>Discount</td>
            <td class="total-value">-100.00</td>
        </tr>
        <tr>
            <td><strong>Total</strong></td>
            <td class="total-value"><strong>1400.00</strong></td>
        </tr>
    </table>

    <div id="sale_return_policy">
        All sales final. No returns after 7 days.
    </div>

    <div id="barcode">
        <img src="https://via.placeholder.com/200x50?text=BARCODE" alt="Barcode">
    </div>

</div>

</body>
</html>

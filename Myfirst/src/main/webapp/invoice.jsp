<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Invoice Preview</title>
<style>
/* Paste your CSS here */
</style>
</head>
<body>

<div id="page-wrap">

    <div id="header">INVOICE</div>

    <!-- First row -->
    <div id="logo">
        <img src="https://via.placeholder.com/270x150.png?text=Your+Logo" alt="Logo">
    </div>

    <div id="customer-title">
        <textarea placeholder="Customer Name"></textarea><br>
        <textarea placeholder="Customer Address"></textarea>
    </div>

    <div style="clear: both;"></div>

    <!-- Second row -->
    <div id="block2">
        <div id="company-title">
            <strong>Your Company Name</strong><br>
            123 Main Street<br>
            City, Country
        </div>

        <table id="meta">
            <tr>
                <td class="meta-head">Invoice #</td>
                <td><textarea>000123</textarea></td>
            </tr>
            <tr>
                <td class="meta-head">Date</td>
                <td><textarea>2025-08-14</textarea></td>
            </tr>
            <tr>
                <td class="meta-head">Amount Due</td>
                <td><textarea>1500.00</textarea></td>
            </tr>
        </table>
    </div>

    <!-- Items Table -->
    <table id="items">
        <tr>
            <th>Item</th>
            <th>Description</th>
            <th>Unit Cost</th>
            <th>Quantity</th>
            <th>Price</th>
        </tr>
        <tr class="item-row">
            <td class="item-name"><textarea>Product A</textarea></td>
            <td class="description"><textarea>Item description here</textarea></td>
            <td><textarea>500.00</textarea></td>
            <td><textarea>2</textarea></td>
            <td><textarea>1000.00</textarea></td>
        </tr>
        <tr>
            <td colspan="3" class="blank"></td>
            <td class="total-line">Subtotal</td>
            <td class="total-value"><textarea>1000.00</textarea></td>
        </tr>
        <tr>
            <td colspan="3" class="blank"></td>
            <td class="total-line">Total</td>
            <td class="total-value"><textarea>1500.00</textarea></td>
        </tr>
        <tr>
            <td colspan="3" class="blank"></td>
            <td class="total-line balance">Balance Due</td>
            <td class="total-value balance"><textarea>1500.00</textarea></td>
        </tr>
    </table>

    <!-- Terms -->
    <div id="terms">
        <h5>Terms</h5>
        <textarea>Payment is due within 30 days</textarea>
    </div>

</div>
<style>

/* body { * font: 14px/1.4 Georgia, serif; * } */ #page-wrap { width: 100%; margin: 0 auto; max-width: 800px; } #page-wrap textarea { border: none; font-size: 14px; overflow: hidden; resize: none; } #page-wrap table { border-collapse: collapse; } #page-wrap table td, #page-wrap table th { border: 1px solid black; padding: 5px; } #page-wrap table td { padding: 5px; } #header { margin: 20px 0; background: #222; text-align: center; color: white; font-size: 2.0em; font-weight: bold; letter-spacing: 4px; padding: 10px 0; } /* First row */ #logo { text-align: right; margin-top: 15px; float: left; position: relative; border: 1px solid #fff; max-height: 150px; overflow: hidden; } #logo img { max-height: 150px; max-width: 270px; } /* #logo:hover, * #logo.edit { * border: 1px solid #000; * margin-top: 0px; * max-height: 125px; * } */ #logoctr { display: none; } #logo:hover #logoctr, #logo.edit #logoctr { display: block; text-align: right; line-height: 25px; background: #eee; padding: 0 5px; } #logohelp { text-align: left; display: none; font-style: italic; padding: 10px 5px; } #logohelp input { margin-bottom: 5px; } .edit #logohelp { display: block; } .edit #save-logo, .edit #cancel-logo { display: inline; } .edit #image, #save-logo, #cancel-logo, .edit #change-logo, .edit #delete-logo { display: none; } #customer-title { height: 100px; float: right; margin-top: 40px; } #customer-title textarea { width: 200px; } /* Second row */ #block2 { overflow: hidden; width: 100%; } #company-title { float: left; } #meta { margin-top: 1px; width: 300px; float: right; } #meta td { text-align: right; } #meta td.meta-head { text-align: left; background: #eee; } #meta td textarea { width: 100%; height: 20px; text-align: right; } #items { clear: both; width: 100%; margin: 30px 0 0 0; border: 1px solid black; } #items th { background: #eee; text-align: center; } #items textarea { width: 80px; height: 20px; } #items tr.item-row td { border: none; vertical-align: top; } #items td.description { width: 300px; } #items td.item-name { width: 175px; } #items td.item-description textarea { height: auto; width: 100%; } #items td.description textarea, #items td.item-name textarea { width: 100%; } #items td.total-line { border-right: 0; text-align: right; } #items td.total-value { border-left: 0; padding: 10px; } #items td.total-value textarea { height: 20px; background: none; } #items td.total-line textarea { height: 20px; width: 150px; background: none; } #items td.balance { background: #eee; } #items td.blank { border: none; } #items td.blank-bottom { border: 1px; } #terms { text-align: center; margin: 20px 0 0 0; } #terms h5 { text-transform: uppercase; font-size: 13px; letter-spacing: 10px; border-bottom: 1px solid black; padding: 0 0 8px 0; margin: 0 0 8px 0; } #terms textarea { width: 100%; text-align: center; } .delete-wpr { position: relative; } .delete { display: block; color: #000; text-decoration: none; position: absolute; background: #EEEEEE; font-weight: bold; padding: 0px 3px; border: 1px solid; top: -6px; left: -22px; font-family: Verdana; font-size: 12px; }
</style>

</body>
</html>

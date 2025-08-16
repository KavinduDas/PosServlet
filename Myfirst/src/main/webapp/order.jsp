<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <style>
        /* Container styles */
        .container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding: 20px;
            margin-left: 82px;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1e1e1e;
            color: white;
        }

        /* Form styles */
        .form-group { margin-bottom: 20px; }
        .name-fields { display: flex; gap: 20px; margin-bottom: 25px; }
        .label-fields { display: flex; justify-content: space-between; width: 66%; }

        .checkout-form { width: 85%; }
        .checkout-form #checkout-title {
            font-size: 21px;
            font-family: 'Times New Roman', Times, serif;
            margin-bottom: 25px;
        }
        .checkout-form label { display: block; margin-bottom: 15px; }
        .checkout-form input[type="text"],
        .checkout-form select,
        .checkout-form input[type="email"],
        .checkout-form textarea {
            width: 95%;
            padding: 15px;
            background-color: transparent;
            border: 1px solid #696866;
            border-radius: 5px;
            color: white;
        }

        /* Order Summary card styles */
        .order-summary { padding-bottom: 20px; }
        .order-summary h2 {
            font-size: 20px;
            font-family: 'Times New Roman', Times, serif;
            margin-bottom: 10px;
        }
        .order-summary ul { list-style: none; padding: 0; margin: 0; padding-top: 15px; }
        .order-summary ul li {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            margin-right: 12px;
        }
        .item-price { font-size: 15px; }

        .sub {
            padding-top: 15px;
            border-top: 1px solid #696866;
        }
        .price { float: right; margin-right: 12px; font-size: 0.905rem; }

        button[name='place_order'] {
            display: block;
            margin: 30px auto;
            width: 40%;
            padding: 15px;
            background-color: #333;
            color: #fff;
            border: 1px solid #696866;
            border-radius: 4px;
            cursor: pointer;
        }
        button[name='place_order']:hover { background-color: #504f4f; }

        /* Loyalty Program Styles */
        .loyalty-program {
            border: 1px solid #696866;
            border-radius: 5px;
            padding: 20px;
            margin-top: 40px;
        }
        .loyalty-program h2 { font-size: 20px; font-weight: 800; }
        #para-one, #para-two { color: #45a049; }
        .loyalty-program input[type="number"] {
            width: 100px;
            padding: 15px;
            background-color: #2d2d2e;
            color: white;
            border: 1px solid #696866;
            border-radius: 5px;
            margin-top: 25px;
        }
        .loyalty-program input[type="submit"] {
            padding: 15px;
            background-color: #207528;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }
        .loyalty-program input[type="submit"]:hover { background-color: #154f1b; }

        .left-contents {
            float: right;
            margin-right: 100px;
            margin-top: 57px;
            width: 30%;
            border: 1px solid #696866;
            border-radius: 5px;
            padding: 25px;
        }
    </style>
</head>
<body>

<!-- Right side: Order Summary & Loyalty -->
<div class="left-contents">
    <div class="order-summary">
        <h2>Your Order:</h2>
        <ul>
            <li><span class="item-info">T-Shirt - L x 2</span><span class="item-price">LKR 2000.00</span></li>
            <li><span class="item-info">Jeans - M x 1</span><span class="item-price">LKR 3500.00</span></li>
        </ul>
    </div>
    <p class="sub">SubTotal: <span class="price">LKR 5500.00</span></p>
    <p class="new-total">Gems Discount: <span class="price">LKR 500.00</span></p>
    <p class="new-total">Final Total: <span class="price">LKR 5000.00</span></p>

    <div class="loyalty-program">
        <h2>Loyalty Program:</h2>
        <p id="para-one">You have 120 gems.</p>
        <p id="para-two">You can use up to 12 LKR discount with your gems.</p>
        <form>
            <label for="gemsToUse">Enter the number of gems to use:</label>
            <input type="number" id="gemsToUse" name="gemsToUse" min="0" max="120">
            <input type="submit" value="Apply Discount">
        </form>
    </div>
</div>

<!-- Left side: Checkout Form -->
<div class="container">
    <div class="checkout-form">
        <h2 id="checkout-title">Billing Details</h2>
        <form>
            <div class="form-group">
                <label for="contact_information">Contact Information:</label>
                <select id="contact_information" name="contact_information">
                    <option value="">Select Contact Information</option>
                    <option value="1">John Doe</option>
                    <option value="new">Add New</option>
                </select>
            </div>
            <div id="contact_info_form">
                <div class="label-fields">
                    <label for="first_name">First Name:</label>
                    <label for="last_name">Last Name:</label>
                    <label for="title">Title:</label>
                </div>
                <div class="name-fields">
                    <input type="text" id="first_name" name="first_name" required>
                    <input type="text" id="last_name" name="last_name" required>
                    <input type="text" id="title" name="title" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="contact">Contact No:</label>
                    <input type="text" id="contact" name="contact" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <textarea id="address" name="address" required></textarea>
                </div>
                <div class="form-group">
                    <label for="district">District:</label>
                    <select id="district" name="district" required>
                        <option value="">Select District</option>
                        <option value="colombo">Colombo</option>
                        <option value="kandy">Kandy</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="payment_method">Payment Method:</label>
                <select id="payment_method" name="payment_method" required>
                    <option value="">Select Payment Method</option>
                    <option value="CashOnDelivery">Cash On Delivery</option>
                    <option value="credit_card">Credit Card</option>
                </select>
            </div>
            <button type="submit" name="place_order">Place Order</button>
        </form>
    </div>
</div>

</body>
</html>

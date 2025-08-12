<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
    <style>
        body {
            font-family: 'Tahoma', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            display: flex;
        }
        .left-panel {
            flex: 1;
            padding-right: 20px;
        }
        .right-panel {
            flex: 1;
        }
        .panel {
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .form-group label {
            width: 100px;
            font-size: 14px;
            font-weight: bold;
            margin-right: 10px;
        }
        .form-group input {
            flex: 1;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }
        .buttons button {
            padding: 10px 20px;
            font-size: 12px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .buttons button.save { background: #28a745; color: #fff; }
        .buttons button.search { background: #007bff; color: #fff; }
        .buttons button.update { background: #ffc107; color: #000; }
        .buttons button.delete { background: #dc3545; color: #fff; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background: #f8f9fa;
            font-weight: bold;
        }
        tr:hover {
            background: #f1f1f1;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left-panel">
            <div class="panel">
                <h3>Product Info</h3>
                <div class="form-group">
                    <label>Search ID:</label>
                    <input type="text" id="p_src" value="0">
                </div>
            </div>
            <div class="panel">
                <div class="form-group">
                    <label>Name:</label>
                    <input type="text" id="p_name" value="0">
                </div>
                <div class="form-group">
                    <label>Bar Code:</label>
                    <input type="text" id="p_bcode" value="0">
                </div>
                <div class="form-group">
                    <label>Price:</label>
                    <input type="text" id="p_price" value="0">
                </div>
                <div class="form-group">
                    <label>Qty:</label>
                    <input type="text" id="p_qty" value="0">
                </div>
                <div class="form-group">
                    <label>Supplier ID:</label>
                    <input type="text" id="p_sid" value="0">
                </div>
                <div class="buttons">
                    <button class="save" onclick="saveProduct()">Save</button>
                    <button class="search" onclick="searchProduct()">Search</button>
                    <button class="update" onclick="updateProduct()">Update</button>
                    <button class="delete" onclick="deleteProduct()">Delete</button>
                </div>
            </div>
        </div>
        <div class="right-panel">
            <div class="form-group">
                <label>Search:</label>
                <input type="text" id="c_search_tbl" onkeyup="searchTable()" value="0">
            </div>
            <table id="productTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Product Name</th>
                        <th>Bar Code</th>
                        <th>Price</th>
                        <th>Qty</th>
                        <th>SID</th>
                    </tr>
                </thead>
                <tbody id="tableBody"></tbody>
            </table>
        </div>
    </div>

    <script>
        // Simulated database
        let products = [];
        let nextId = 1;

        // Load table
        function loadTable(data = products) {
            const tbody = document.getElementById('tableBody');
            tbody.innerHTML = '';
            data.forEach(product => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${product.id}</td>
                    <td>${product.product_name}</td>
                    <td>${product.bar_code}</td>
                    <td>${product.price}</td>
                    <td>${product.qty}</td>
                    <td>${product.sid}</td>
                `;
                row.onclick = () => populateForm(product);
                tbody.appendChild(row);
            });
        }

        // Populate form when table row is clicked
        function populateForm(product) {
            document.getElementById('p_src').value = product.id;
            document.getElementById('p_name').value = product.product_name;
            document.getElementById('p_bcode').value = product.bar_code;
            document.getElementById('p_price').value = product.price;
            document.getElementById('p_qty').value = product.qty;
            document.getElementById('p_sid').value = product.sid;
        }

        // Save product
        function saveProduct() {
            const product = {
                id: nextId++,
                product_name: document.getElementById('p_name').value,
                bar_code: document.getElementById('p_bcode').value,
                price: document.getElementById('p_price').value,
                qty: document.getElementById('p_qty').value,
                sid: document.getElementById('p_sid').value
            };
            products.push(product);
            alert('Data saved');
            loadTable();
            clearForm();
        }

        // Search product by ID
        function searchProduct() {
            const id = document.getElementById('p_src').value;
            const product = products.find(p => p.id == id);
            if (product) {
                populateForm(product);
            } else {
                alert('Product not found');
            }
        }

        // Update product
        function updateProduct() {
            const id = document.getElementById('p_src').value;
            const index = products.findIndex(p => p.id == id);
            if (index !== -1) {
                products[index] = {
                    id: parseInt(id),
                    product_name: document.getElementById('p_name').value,
                    bar_code: document.getElementById('p_bcode').value,
                    price: document.getElementById('p_price').value,
                    qty: document.getElementById('p_qty').value,
                    sid: document.getElementById('p_sid').value
                };
                alert('Data updated');
                loadTable();
                clearForm();
            } else {
                alert('Product not found');
            }
        }

        // Delete product
        function deleteProduct() {
            const id = document.getElementById('p_src').value;
            const index = products.findIndex(p => p.id == id);
            if (index !== -1) {
                products.splice(index, 1);
                alert('Data deleted');
                loadTable();
                clearForm();
            } else {
                alert('Product not found');
            }
        }

        // Clear form
        function clearForm() {
            document.getElementById('p_name').value = '0';
            document.getElementById('p_bcode').value = '0';
            document.getElementById('p_price').value = '0';
            document.getElementById('p_qty').value = '0';
            document.getElementById('p_sid').value = '0';
            document.getElementById('p_src').value = '0';
        }

        // Search table
        function searchTable() {
            const name = document.getElementById('c_search_tbl').value.toLowerCase();
            const filtered = products.filter(p => p.product_name.toLowerCase().includes(name));
            loadTable(filtered);
        }

        // Initial table load
        loadTable();
    </script>
</body>
</html>
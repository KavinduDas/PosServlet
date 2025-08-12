<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Management</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <!-- Google Material Symbols -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <style>
        :root {
            --bg-color: #f5f5f5;  /* Whitish grey background */
            --sidebar-color: #2d2d2d;
            --card-color: #ffffff;
            --text-color: #333333;
            --highlight-color: #e0e0e0;
            --border-color: #d0d0d0;
            --dark-text: #2d2d2d;
            --light-text: #666666;
        }
        
        body {
            font-family: 'Tahoma', sans-serif;
            margin: 0;
            padding: 0;
            background-color:#1e1e1e;
            color: var(--text-color);
            display: flex;
            min-height: 100vh;
        }

        /* Header Styles */
        .header {
            height: 60px;
            background: #1e1e1e;
            border-bottom: 2px solid var(--border-color);
            display: flex;
            align-items: center;
            padding-left: 15px;
            font-size: 20px;
            font-weight: bold;
            color: #ffffff;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .logo {
            height: 40px;
            margin-right: 15px;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 180px;
            background: var(--sidebar-color);
            border-right: 2px solid #444;
            display: flex;
            flex-direction: column;
            padding-top: 80px;
            position: fixed;
            height: 100vh;
        }

        .menu-btn {
            display: flex;
            align-items: center;
            padding: 12px 15px;
            margin: 5px 10px;
            background: #3a3a3a;
            border: 1px solid #444;
            cursor: pointer;
            font-weight: bold;
            font-size: 14px;
            color: #eee;
            text-decoration: none;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .menu-btn i {
            margin-right: 10px;
            font-size: 18px;
            vertical-align: middle;
        }

        .menu-btn:hover {
            background: #4a4a4a;
            border-color: #555;
            color: #fff;
        }

        .menu-btn.active {
            background: #5a5a5a;
            border-color: #666;
            color: #fff;
            cursor: default;
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 80px 20px 20px 200px;
           background-color: #1e1e1e;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: var(--card-color);
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border: 1px solid var(--border-color);
        }

        .tabs {
            display: flex;
            border-bottom: 2px solid #ccc;
            margin-bottom: 20px;
        }
        .tab {
            padding: 10px 20px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            border-bottom: 3px solid transparent;
            color: var(--dark-text);
        }
        .tab.active {
            border-bottom: 3px solid #007bff;
            color: #007bff;
        }
        .tab-content {
            display: none;
        }
        .tab-content.active {
            display: block;
        }
        .panel {
            border: 1px solid var(--border-color);
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            background-color: var(--card-color);
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .form-group label {
            width: 150px;
            font-size: 14px;
            font-weight: bold;
            margin-right: 10px;
            color: var(--dark-text);
        }
        .form-group input, .form-group textarea {
            flex: 1;
            padding: 8px;
            font-size: 14px;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            background-color: var(--card-color);
            color: var(--dark-text);
        }
        .form-group textarea {
            height: 80px;
            resize: vertical;
        }
        .contact-person {
            border: 1px solid var(--border-color);
            padding: 15px;
            border-radius: 5px;
            margin-left: 20px;
            background-color: var(--card-color);
        }
        .buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }
        .buttons button {
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .buttons button.save { background: #28a745; color: #fff; }
        .buttons button.search { background: #007bff; color: #fff; }
        .buttons button.update { background: #ffc107; color: #000; }
        .buttons button.delete { background: #dc3545; color: #fff; }
        .checkbox-group {
            display: flex;
            align-items: center;
            margin: 10px 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid var(--border-color);
        }
        th, td {
            padding: 10px;
            text-align: left;
            color: var(--dark-text);
        }
        th {
            background: #f8f9fa;
            font-weight: bold;
        }
        tr:hover {
            background: #f1f1f1;
            cursor: pointer;
        }
        .report-panel button {
            display: block;
            width: 300px;
            padding: 15px;
            margin: 20px 0;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background: #007bff;
            color: #fff;
        }

        /* User Info */
        .user-info {
            display: flex;
            align-items: center;
            position: absolute;
            right: 20px;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
            background-color: #555;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        h1, h2, h3 {
            color: var(--dark-text);
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <img src="Image/gem.png" alt="Fashion Paradise Logo" class="logo">
        Fashion Paradise POS System
        <div class="user-info">
            <div class="user-avatar">
                <i class="fas fa-user"></i>
            </div>
            <span style="color: var(--dark-text);">Admin User</span>
        </div>
    </div>

    <!-- Sidebar -->
    <nav class="sidebar">
        <a href="dashboard?page=dashboard" class="menu-btn">
            <i class="fas fa-tachometer-alt"></i> Dashboard
        </a>
        <a href="customer-management.jsp" class="menu-btn active">
            <i class="fas fa-user-circle"></i> Customers
        </a>
        <a href="dashboard?page=supplier" class="menu-btn">
            <i class="fa-solid fa-landmark"></i> Supplier
        </a>
        <a href="dashboard?page=employee" class="menu-btn">
            <i class="material-symbols-outlined">badge</i> Employee
        </a>
        <a href="dashboard?page=product" class="menu-btn">
            <i class="material-symbols-outlined">add_shopping_cart</i> Product
        </a>
        <a href="dashboard?page=sales" class="menu-btn">
            <i class="material-symbols-outlined">finance_mode</i> Sales
        </a>
        <a href="dashboard?page=invoice" class="menu-btn">
            <i class="fas fa-file-invoice"></i> Invoice
        </a>
        <a href="dashboard?page=reports" class="menu-btn">
            <i class="fas fa-chart-bar"></i> Reports
        </a>
    </nav>

    <!-- Main Content -->
    
    <div class="main-content">
        <div class="container">
            <div class="tabs">
                <div class="tab active" data-tab="add-customer">Add Customer</div>
                <div class="tab" data-tab="search-customer">Search Customer</div>
                <div class="tab" data-tab="reports">Reports</div>
            </div>

            <!-- Add Customer Tab -->
            <form action ="">
            <div class="tab-content active" id="add-customer">
<!--                 <div class="panel"> -->
<!--                     <div class="form-group"> -->
<!--                         <label>Search ID:</label> -->
<!--                         <input type="text" id="c_search" value="0"> -->
<!--                     </div> -->
<!--                 </div> -->
                <div class="panel">
                    <div style="display: flex;">
                        <div style="flex: 1;">
                            <div class="form-group">
                                <label>Name:</label>
                                <input type="text" id="c_name">
                            </div>
                            <div class="form-group">
                                <label>T.P Number:</label>
                                <input type="text" id="c_tp">
                            </div>
                            <div class="form-group">
                                <label>Billing Address:</label>
                                <textarea id="c_billadd"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Shipping Address:</label>
                                <textarea id="c_shipadd"></textarea>
                            </div>
                            <div class="checkbox-group">
                                <input type="checkbox" id="same" onclick="copyBillingAddress()">
                                <label for="same" style="width: auto; margin-left: 10px;">Same as Billing</label>
                            </div>
                            <div class="form-group">
                                <label>Bank Acc No:</label>
                                <input type="text" id="c_bank">
                            </div>
                            <div class="form-group">
                                <label>City:</label>
                                <input type="text" id="c_city">
                            </div>
                        </div>
                        </form>
                        <div class="contact-person">
                            <h3>Contact Person</h3>
                            <div class="form-group">
                                <label>Name:</label>
                                <input type="text" id="cp_name">
                            </div>
                            <div class="form-group">
                                <label>Contact Person:</label>
                                <input type="text" id="c_person">
                            </div>
                            <div class="form-group">
                                <label>T.P Number:</label>
                                <input type="text" id="cp_tp">
                            </div>
                            <div class="form-group">
                                <label>Email:</label>
                                <input type="text" id="cp_email">
                            </div>
                            <div class="form-group">
                                <label>Online:</label>
                                <input type="text" id="cp_online">
                            </div>
                        </div>
                    </div>
                    <div class="buttons">
                        <button class="save" onclick="saveCustomer()">Save</button>
                        <button class="search" onclick="searchCustomer()">Search</button>
                        <button class="update" onclick="updateCustomer()">Update</button>
                        <button class="delete" onclick="deleteCustomer()">Delete</button>
                    </div>
                </div>
            </div>

            <!-- Search Customer Tab -->
            <div class="tab-content" id="search-customer">
                <div class="panel">
                    <div class="form-group">
                        <label>Customer Name:</label>
                        <input type="text" id="c_search_tbl" onkeyup="searchTable()">
                    </div>
                    <div style="display: flex; gap: 20px;">
                        <div class="form-group">
                            <label>City:</label>
                            <input type="text" id="sh_city" onkeyup="searchTable()">
                        </div>
                        <div class="form-group">
                            <label>Telephone:</label>
                            <input type="text" id="sh_tp" onkeyup="searchTable()">
                        </div>
                        <div class="form-group">
                            <label>Contact Person:</label>
                            <input type="text" id="sh_cp" onkeyup="searchTable()">
                        </div>
                        <div class="form-group">
                            <label>Person Name:</label>
                            <input type="text" id="sh_pn" onkeyup="searchTable()">
                        </div>
                    </div>
                </div>
                <table id="customerTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Customer Name</th>
                            <th>T.P Number</th>
                            <th>Billing Address</th>
                            <th>Shipping Address</th>
                            <th>Bank</th>
                            <th>City</th>
                            <th>Person Name</th>
                            <th>Contact Person</th>
                            <th>Person TP</th>
                            <th>Email</th>
                            <th>Online</th>
                        </tr>
                    </thead>
                    <tbody id="tableBody"></tbody>
                </table>
            </div>

            <!-- Reports Tab -->
            <div class="tab-content" id="reports">
                <div class="report-panel">
                    <button onclick="viewAllCustomerReport()">All Customer Reports</button>
                    <div class="form-group">
                        <label>Customer ID:</label>
                        <input type="text" id="cid">
                    </div>
                    <button onclick="viewCustomerReport()">View Report</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Simulated database
        let customers = [];
        let nextId = 1;

        // Tab navigation
        document.querySelectorAll('.tab').forEach(tab => {
            tab.addEventListener('click', () => {
                document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
                document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
                tab.classList.add('active');
                document.getElementById(tab.dataset.tab).classList.add('active');
            });
        });

        // Copy billing address to shipping address
        function copyBillingAddress() {
            const billing = document.getElementById('c_billadd').value;
            const shipping = document.getElementById('c_shipadd');
            if (document.getElementById('same').checked) {
                shipping.value = billing;
            } else {
                shipping.value = '';
            }
        }

        // Load table
        function loadTable(data = customers) {
            const tbody = document.getElementById('tableBody');
            tbody.innerHTML = '';
            data.forEach(customer => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${customer.id}</td>
                    <td>${customer.customer_name}</td>
                    <td>${customer.tp_number}</td>
                    <td>${customer.billing_address}</td>
                    <td>${customer.shipping_address}</td>
                    <td>${customer.bank}</td>
                    <td>${customer.city}</td>
                    <td>${customer.person_name}</td>
                    <td>${customer.contact_person}</td>
                    <td>${customer.person_tp}</td>
                    <td>${customer.email}</td>
                    <td>${customer.online}</td>
                `;
                row.onclick = () => populateForm(customer);
                tbody.appendChild(row);
            });
        }

        // Populate form when table row is clicked
        function populateForm(customer) {
            document.getElementById('c_search').value = customer.id;
            document.getElementById('c_name').value = customer.customer_name;
            document.getElementById('c_tp').value = customer.tp_number;
            document.getElementById('c_billadd').value = customer.billing_address;
            document.getElementById('c_shipadd').value = customer.shipping_address;
            document.getElementById('c_bank').value = customer.bank;
            document.getElementById('c_city').value = customer.city;
            document.getElementById('cp_name').value = customer.person_name;
            document.getElementById('c_person').value = customer.contact_person;
            document.getElementById('cp_tp').value = customer.person_tp;
            document.getElementById('cp_email').value = customer.email;
            document.getElementById('cp_online').value = customer.online;

            // Switch to Add Customer tab
            document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
            document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
            document.querySelector('.tab[data-tab="add-customer"]').classList.add('active');
            document.getElementById('add-customer').classList.add('active');
        }

        // Save customer
        function saveCustomer() {
            const customer = {
                id: nextId++,
                customer_name: document.getElementById('c_name').value,
                tp_number: document.getElementById('c_tp').value,
                billing_address: document.getElementById('c_billadd').value,
                shipping_address: document.getElementById('c_shipadd').value,
                bank: document.getElementById('c_bank').value,
                city: document.getElementById('c_city').value,
                person_name: document.getElementById('cp_name').value,
                contact_person: document.getElementById('c_person').value,
                person_tp: document.getElementById('cp_tp').value,
                email: document.getElementById('cp_email').value,
                online: document.getElementById('cp_online').value
            };
            customers.push(customer);
            alert('Data saved');
            loadTable();
            clearForm();
        }

        // Search customer by ID
        function searchCustomer() {
            const id = document.getElementById('c_search').value;
            const customer = customers.find(c => c.id == id);
            if (customer) {
                populateForm(customer);
            } else {
                alert('Customer not found');
            }
        }

        // Update customer
        function updateCustomer() {
            const id = document.getElementById('c_search').value;
            const index = customers.findIndex(c => c.id == id);
            if (index !== -1) {
                customers[index] = {
                    id: parseInt(id),
                    customer_name: document.getElementById('c_name').value,
                    tp_number: document.getElementById('c_tp').value,
                    billing_address: document.getElementById('c_billadd').value,
                    shipping_address: document.getElementById('c_shipadd').value,
                    bank: document.getElementById('c_bank').value,
                    city: document.getElementById('c_city').value,
                    person_name: document.getElementById('cp_name').value,
                    contact_person: document.getElementById('c_person').value,
                    person_tp: document.getElementById('cp_tp').value,
                    email: document.getElementById('cp_email').value,
                    online: document.getElementById('cp_online').value
                };
                alert('Data updated');
                loadTable();
                clearForm();
            } else {
                alert('Customer not found');
            }
        }

        // Delete customer
        function deleteCustomer() {
            const id = document.getElementById('c_search').value;
            const index = customers.findIndex(c => c.id == id);
            if (index !== -1) {
                customers.splice(index, 1);
                alert('Data deleted');
                loadTable();
                clearForm();
            } else {
                alert('Customer not found');
            }
        }

        // Clear form
        function clearForm() {
            document.getElementById('c_name').value = '';
            document.getElementById('c_tp').value = '';
            document.getElementById('c_billadd').value = '';
            document.getElementById('c_shipadd').value = '';
            document.getElementById('c_bank').value = '';
            document.getElementById('c_city').value = '';
            document.getElementById('cp_name').value = '';
            document.getElementById('c_person').value = '';
            document.getElementById('cp_tp').value = '';
            document.getElementById('cp_email').value = '';
            document.getElementById('cp_online').value = '';
            document.getElementById('c_search').value = '0';
        }

        // Search table
        function searchTable() {
            const city = document.getElementById('sh_city').value.toLowerCase();
            const tp = document.getElementById('sh_tp').value.toLowerCase();
            const cp = document.getElementById('sh_cp').value.toLowerCase();
            const pn = document.getElementById('sh_pn').value.toLowerCase();
            const name = document.getElementById('c_search_tbl').value.toLowerCase();

            const filtered = customers.filter(c =>
                (name === '' || c.customer_name.toLowerCase().includes(name)) &&
                (city === '' || c.city.toLowerCase().includes(city)) &&
                (tp === '' || c.tp_number.toLowerCase().includes(tp)) &&
                (cp === '' || c.contact_person.toLowerCase().includes(cp)) &&
                (pn === '' || c.person_name.toLowerCase().includes(pn))
            );
            loadTable(filtered);
        }

        // View all customer report (simulated)
        function viewAllCustomerReport() {
            alert('Displaying all customer report (simulated)');
            console.log('All Customers:', customers);
        }

        // View customer report by ID (simulated)
        function viewCustomerReport() {
            const id = document.getElementById('cid').value;
            const customer = customers.find(c => c.id == id);
            if (customer) {
                alert(`Displaying report for Customer ID ${id} (simulated)`);
                console.log('Customer Report:', customer);
            } else {
                alert('Customer not found');
            }
        }

        // Initial table load
        loadTable();
    </script>
</body>
</html>
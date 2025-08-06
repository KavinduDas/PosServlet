<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Sidebar</title>
  <link rel="stylesheet" href="sidebar.css">
</head>

<body>
  <div class="sidebar-wrapper">
 <div class="top-navbar">  
  <div class="datetime">
    <i class="material-symbols-outlined">date_range</i>
    <span id="currentDate"></span>
    <span class="separator">|</span>
    <i class="material-symbols-outlined">timer</i>
    <span id="currentTime"></span>
  </div>


</div>
  
    <button id="sidebarToggle" class="sidebar-toggle" aria-label="Toggle Sidebar">☰</button>

    <aside id="sidebar" class="sidebar">
      <header class="sidebar-header">
      
      </header>

      <hr class="sidebar-separator" />

      <nav class="sidebar-menu">
        <ul>
          <li><a href="Sales.js" class="sidebar-link"><i class="fas fa-user-circle"></i>Customer</a></li>
          <li><a href="#" class="sidebar-link"><i class="fa-solid fa-landmark"></i>Accounts</a></li>
          <li><a href="#" class="sidebar-link"><i class="material-symbols-outlined">finance_mode</i>Sales</a></li> 
          <li><a href="#" class="sidebar-link"><i class="material-symbols-outlined">add_shopping_cart</i>Product</a></li>
          <li><a href="#" class="sidebar-link"><i class="material-symbols-outlined">badge</i>Employee</a></li>
          <li><a href="#" class="sidebar-link">Employee</a></li>
          
        </ul>
      </nav>

      <footer class="sidebar-footer">
        <p>&copy; 2025 Sidebar Inc.</p>
      </footer>
    </aside>

    <main class="main-content">
     
    </main>
  </div>
  <script>
  function updateDateTime() {
    const now = new Date();
    const date = now.toLocaleDateString();  // e.g. "8/6/2025"
    const time = now.toLocaleTimeString();  // e.g. "10:22:45 PM"

    document.getElementById('currentDate').textContent = date;
    document.getElementById('currentTime').textContent = time;
  }

  // Update immediately, then every second
  updateDateTime();
  setInterval(updateDateTime, 1000);
</script>
  

  <script>
  
    document.getElementById('sidebarToggle').addEventListener('click', function () {
      document.getElementById('sidebar').classList.toggle('collapsed');
    });
  </script>
</body>
</html>

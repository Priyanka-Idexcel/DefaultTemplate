<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">

  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">


</head>
<body>
  <div class="sidebar">
    <div class="logo"></div>
      <ul class="menu">
        <li class="active">
          <a>
            <%= link_to root_path do %>
            <i class="ri-home-5-line"></i>
            <span>Home</span>
            <% end %>
          </a>
        </li>
        <li>
          <a>
            <%= link_to home_label_path do %>
            <i class="ri-price-tag-3-fill"></i>
            <span>Add Label</span>
            <% end %>
          </a>
        </li>
        <li>
          <a>
            <%= link_to home_commit_path do %>
            <i class="ri-git-repository-commits-line"></i>
            <span>Commit Difference</span>
            <% end %>
          </a>
        </li>
        <li>
          <a>
            <%= link_to home_generate_path do %>
            <i class="ri-file-excel-fill"></i>
            <span>Generate Excel</span>
            <% end %>
          </a>
        </li>
        <li>
          <a>
            <%= link_to home_branch_path do %>
            <i class="ri-file-excel-line"></i>
            <span>Branches</span>
            <% end %>
          </a>
        </li>
        <li>
          <a>
            <%= link_to home_about_path do %>
            <i class="ri-information-fill"></i>
            <span>About</span>
            <% end %>
          </a>
        </li>
        <li class="logout">
          <a href = "#">
            <i class="ri-login-box-fill"></i></i>
            <span>Log Out</span>
          </a>
        </li>
      </ul>
    </div>
    <div class="main-content">
      <div class="header-wrapper">
        <div class="header-title">
          <span>Primary</span>
          <h3>Release Dashboard</h3>
    </div>
    <div class="user-info">
      <%= button_to "Log out", destroy_user_session_path, method: :delete, %>

    </div>
  </div>
  <!-- <div class="card-container">
    <h3 class="main-title">Today Data</h3>
    <div class="card-wrapper">

      <div class="card-header">
        <div class="amount">
          <h6>Title</h6>
        </div>
      </div>

    </div>
  </div> -->
</div>


  
  </body>

</html>




<style type="text/css">

  *{
    margin: 0;
    padding: 0;
    border: none;
    outline: none;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
  }

  body {
    display: flex;
  }
  .sidebar {
    position: sticky;
    top: 0;
    bottom: 0;
    left: 0;
    width: 110px;
    height: 100vh;
    padding: 0 1.7rem;
    color: #fff;
    overflow: hidden;
    transition: all 0.5s linear;
    background: rgba(113, 99, 186, 255);
  }
  .sidebar:hover {
    width: 300px;
    transition: 0.5s; #sidebar open one close to use this
  }
  .logo {
    height: 80px;
    padding: 16px;
  }

  .menu {
    height: 88%;
    position: relative;
    list-style: none;
    padding: 0;
  }
  .menu li {
    padding: 1rem;
    margin: 8px 0;
    border-radius: 8px;
    transition: all o.5s ease-in-out;
  }
  .menu li:hover, .active {
    background: #e0e0e058;
  }
  .menu a {
    color: #fff;
    font-size: 14px;
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 1.5rem;
  }
  .menu a span {
    overflow: hidden;
  }
  .menu a i {
    font-size: 1.2rem;
  }
  /*.logout {
    position: absolute;
    bottom: 90px;
    left: 0;
    width: 100%;
  }*/

  .main-content {
    position: relative;
    background: #ebe9e9;
    width: 100%;
    padding: 1rem;
  }
  .header-wrapper {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    background: #fff;
    border-radius: 10px;
    padding: 10px 2rem;
    margin-bottom: 1rem;
  }
  .header-title {
    color: rgba(113, 99, 186, 255);
  }
  /*.logout {
    color: #ebe9e9;
  }*/
  .user-info {
    display: flex;
    align-items: center;
    gap: 1;
  }
  .card-container {
    background: #fff;
    padding: 2rem;
    border-radius: 10px;
  }
  .card-wrapper {
    background: rgb(229, 223, 223);
    border-radius: 10px;
    padding: 1.2rem;
    width: 290px;
    height: 150px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    transition: all 0.5s ease-in-out;
  }
  .main-title {
    color: rgba(113, 99, 186, 225);
    padding-bottom: 10px;
    font-size: 15px;
  }
  </style>



gdhsj
















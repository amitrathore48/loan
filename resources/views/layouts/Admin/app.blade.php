<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
  <meta name="author" content="Creative Tim">
  <title>Welcome to Admin Panel</title>
  <!-- Favicon -->
   <meta name="_token" content="{{csrf_token()}}" />
  <link rel="icon" href="{{ url('public/assets/img/brand/favicon.png') }}" type="image/png">
  <!-- Fonts -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
  <!-- Icons -->
  <link rel="stylesheet" href="{{ url('public/assets/vendor/nucleo/css/nucleo.css') }}" type="text/css">
  <link rel="stylesheet" href="{{ url('public/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css') }}" type="text/css">
  <!-- Page plugins -->
  <!-- Argon CSS -->
  <link rel="stylesheet" href="{{ url('public/assets/css/argon.css?v=1.2.0') }}" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>

  <style type="text/css">
  .jtable thead tr{ height: 55px !important; }
  .jtable-main-container > table.jtable > tbody tr td {
    padding: 5px !important;
    border: 1px solid #d1d1d1 !important;
    font-weight: 400 !important;
    font-size: 13px !important;
    color: #212529 !important;
  }
  div.jtable-main-container > table.jtable > thead th {
    background: rgba(53, 152, 220, 0.41) !important;
    padding: 15px 5px !important;
  }
  div.jtable-main-container {
    font-family: "ubuntu-regular", sans-serif;
    font-size: 14px !important;
  }
  .navbar-vertical.navbar-expand-xs .navbar-nav > .nav-item > .nav-link.active {
   background: #ebebeb;
  }
  </style>
</head>


<body>
        @include('layouts.Admin.sidebar')
        @include('layouts.Admin.header')
        @yield('content')
        @include('layouts.Admin.footer')
       
 </body>
</html> 
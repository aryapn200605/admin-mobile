<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">

        <!-- Preloader -->
        {{-- <div class="preloader flex-column justify-content-center align-items-center">
            <img class="animation__shake" src="{{ asset('lte/dist/img/AdminLTELogo.png') }}" alt="AdminLTELogo"
                height="60" width="60">
        </div> --}}

        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item d-flex align-items-center">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button">
                        <i class="fas fa-bars"></i>
                    </a>
                    @php
                        $cookie = Cookie::get('userLogin');
                        $decoded_cookie = json_decode($cookie);
                    @endphp
                    <h3 class="ml-2">{{ $decoded_cookie->tenant_name }}</h3>
                </li>
            </ul>
        </nav>        

        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="/" class="brand-link">
                <img src="{{ asset('lte/dist/img/AdminLTELogo.png') }}" alt="AdminLTE Logo"
                    class="brand-image img-circle elevation-3" style="opacity: .8">
                <span class="brand-text font-weight-light">Admin Mobile</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                {{-- <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="info">
                        <a href="#" class="d-block">Alexander Pierce</a>
                    </div>
                </div> --}}

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                        data-accordion="false">
                        <li class="nav-item">
                            <a href="{{ route('home') }}" class="nav-link">
                                <i class="nav-icon fas fa-th"></i>
                                <p>
                                    Dashboard
                                </p>
                            </a>
                        </li>
                        {{-- <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon far fa-user"></i>
                                <p>Menu <i class="right fas fa-angle-left"></i></p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{ route('customers') }}" class="nav-link">
                                        <i class="nav-icon far fa-user"></i>
                                        <p>
                                            Users
                                        </p>
                                    </a>
                                </li>
                            </ul>
                        </li> --}}
                        <li class="nav-header">MENU</li>
                        <li class="nav-item">
                            <a href="{{ route('customers') }}" class="nav-link">
                                <i class="nav-icon far fa-user"></i>
                                <p>
                                    Users
                                </p>
                            </a>
                        </li>
                        {{-- <li class="nav-item">
                            <a href="{{ route('batch') }}" class="nav-link">
                                <i class="nav-icon fa fa-money-bill"></i>
                                <p>
                                    Transaksi
                                </p>
                            </a>
                        </li> --}}
                        {{-- <li class="nav-item">
                            <a href="{{ route('payment-method') }}" class="nav-link">
                                <i class="nav-icon fa fa-solid fa-dollar-sign"></i>
                                <p>
                                    Metode Pembayaran
                                </p>
                            </a>
                        </li> --}}
                        <li class="nav-item">
                            <a href="{{ route('product-image') }}" class="nav-link">
                                <i class="nav-icon fa fa-image"></i>
                                <p>
                                    Gambar Produk
                                </p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{ route('reservation-management') }}" class="nav-link">
                                <i class="nav-icon far fa-calendar-alt"></i>
                                <p>
                                    Reservasi
                                </p>
                            </a>
                        </li>
                        <li class="nav-header">TRANSAKSI</li>
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fa fa-solid fa-wallet"></i>
                                <p>Pengajuan<i class="right fas fa-angle-left"></i></p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{ route('savings') }}" class="nav-link">
                                        <i class="nav-icon fa"></i>
                                        <p>
                                            Simpanan
                                        </p>
                                    </a>
                                </li>
                            </ul>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{ route('loans') }}" class="nav-link">
                                        <i class="nav-icon fa"></i>
                                        <p>
                                            Pinjaman
                                        </p>
                                    </a>
                                </li>
                            </ul>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{ route('deposits') }}" class="nav-link">
                                        <i class="nav-icon fa"></i>
                                        <p>
                                            Simpanan Berjangka
                                        </p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fa fa-solid fa-dollar-sign"></i>
                                <p>Transaksi<i class="right fas fa-angle-left"></i></p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{ route('savings-deposit') }}" class="nav-link">
                                        <i class="nav-icon fa"></i>
                                        <p>
                                            Setoran Tabungan
                                        </p>
                                    </a>
                                </li>
                            </ul>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{ route('loan-repay') }}" class="nav-link">
                                        <i class="nav-icon fa"></i>
                                        <p>
                                            Bayar Tagihan
                                        </p>
                                    </a>
                                </li>
                            </ul>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="{{ route('loan-topup') }}" class="nav-link">
                                        <i class="nav-icon fa"></i>
                                        <p>
                                            Top-Up Pinjaman
                                        </p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-header">SETTINGS</li>
                        <li class="nav-item text-center">
                            <a class="nav-link bg-danger" onclick="logout()">
                                <p>
                                    Logout
                                </p>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>

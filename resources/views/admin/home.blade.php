@extends('layouts/panel')

@section('title', 'Dashboard')

@section('content')

    <div class="row">
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
                <div class="inner">
                    <h3>{{ $reservasi }}</h3>

                    <p>Total Pengajuan Reservasi</p>
                </div>
                <div class="icon">
                    <i class="fas fa-calendar-days"></i>
                </div>
                <a href="{{ url('/savings') }}" class="small-box-footer">Selengkapnya<i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
                <div class="inner">
                    <h3>{{ $saving }}</h3>

                    <p>Total Pengajuan Simpanan</p>
                </div>
                <div class="icon">
                    <i class="fas fa-money-check"></i>
                </div>
                <a href="{{ url('/loans') }}" class="small-box-footer">Selengkapnya <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
                <div class="inner">
                    <h3>{{ $loan }}</h3>

                    <p>Total Pengajuan Pinjaman</p>
                </div>
                <div class="icon">
                    <i class="fas fa-sack-dollar"></i>
                </div>
                <a href="{{ url('/deposits') }}" class="small-box-footer">Selengkapnya <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
                <div class="inner">
                    <h3>{{ $deposit }}</h3>

                    <p>Total Pengajuan Simpanan Berjangka</p>
                </div>
                <div class="icon">
                    <i class="fas fa-money-bill-trend-up"></i>
                </div>
                <a href="{{ url('/savings') }}" class="small-box-footer">Selengkapnya <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-pink">
                <div class="inner">
                    <h3>{{ $setoran }}</h3>

                    <p>Total Pengajuan Setoran Simpanan</p>
                </div>
                <div class="icon">
                    <i class="fas fa-piggy-bank"></i>
                </div>
                <a href="{{ url('/savings-deposit') }}" class="small-box-footer">Selengkapnya <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-secondary">
                <div class="inner">
                    <h3>{{ $tagihan }}</h3>

                    <p>Total Pengajuan Pembayaran Tagihan</p>
                </div>
                <div class="icon">
                    <i class="fas fa-hand-holding-dollar"></i>
                </div>
                <a href="{{ url('/loan-repay') }}" class="small-box-footer">Selengkapnya <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-primary">
                <div class="inner">
                    <h3>{{ $topup }}</h3>

                    <p>Total Pengajuan Top Up Pinjaman</p>
                </div>
                <div class="icon">
                    <i class="fas fa-hand-holding-dollar"></i>
                </div>
                <a href="{{ url('/loan-topup') }}" class="small-box-footer">Selengkapnya <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <!-- ./col -->
    </div>
    <!-- /.row -->

@endsection

@section('script')
    <script>
        
    </script>
@endsection

@extends('layouts.panel')

@section('title', 'Detail Bayar Tagihan')

@section('content')

    <div class="row">
        <div class="col-12">
            <div class="card">
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="form-group mb-3">
                        <label>Nama</label>
                        <input type="text" class="form-control" value="{{$data->first_name}}" disabled>
                    </div>
                    <div class="form-group mb-3">
                        <label>No Rekening</label>
                        <input type="text" class="form-control" value="{{$data->loan_id}}" disabled>
                    </div>
                    <div class="form-group mb-3">
                        <label>CIF</label>
                        <input type="text" class="form-control" value="{{$data->customer_id}}" disabled>
                    </div>
                    <div class="form-group mb-3">
                        <label>Jumlah</label>
                        <input type="text" class="form-control" value="{{ 'Rp' . number_format($data->amount, 0, ',', '.') }}" disabled>
                    </div>
                    <a href="/loan-repay/" class="btn btn-secondary">Kembali</a>
                </div>
                <!-- /.card-body -->
            </div>
        </div>
    </div>

@endsection

@section('script')
@endsection

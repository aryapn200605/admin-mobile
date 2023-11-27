@extends('layouts.panel')

@section('title', 'Detail Setoran Tabungan')

@section('content')

    <div class="row">
        <div class="col-12">
            <div class="card">
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row">
                        <div class="form-group mb-3 col-6">
                            <label>Nama</label>
                            <input type="text" class="form-control" value="{{ $data->first_name }}" disabled>
                        </div>
                        <div class="form-group mb-3 col-6">
                            <label>No Rekening</label>
                            <input type="text" class="form-control" value="{{ $data->saving_id }}" disabled>
                        </div>
                        <div class="form-group mb-3 col-6">
                            <label>CIF</label>
                            <input type="text" class="form-control" value="{{ $data->customer_id }}" disabled>
                        </div>
                        <div class="form-group mb-3 col-6">
                            <label>Jumlah</label>
                            <input type="text" class="form-control"
                                value="{{ 'Rp' . number_format($data->amount, 0, ',', '.') }}" disabled>
                        </div>
                        <div class="col-12">
                            <a href="/savings-deposit/" class="btn btn-secondary">Kembali</a>
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
            </div>
        </div>
    </div>

@endsection

@section('script')
@endsection

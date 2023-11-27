@extends('layouts.panel')

@section('title', 'Transaksi')

@section('content')

    <div class="row">
        <div class="col-12">
            <div class="card">
                <!-- /.card-header -->
                <div class="card-body">
                    <table id="datatable" class="table table-bordered table-striped">
                        <thead>
                            <tr class="text-center">
                                <th>No</th>
                                <th>Tenants</th>
                                <th>Dibuat Pada</th>
                                <th>Status</th>
                                <th>Status</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 0; ?>
                            @foreach ($datas as $key => $data)
                                <tr>
                                    <td class="text-center w-1">{{ ++$no }}</td>
                                    <td>{{ $data->tenants }}</td>
                                    <td>{{ $data->created_at }}</td>
                                    @if ($data->status === 1)
                                        <td>Setor Tabungan</td>
                                    @elseif ($data->status === 2)
                                        <td>Tarik Tabungan</td>
                                    @endif
                                    @if ($data->is_active === true)
                                        <td class='text-success p-3'>Aktif</td>
                                    @elseif ($data->is_active === false)
                                        <td class='text-danger p-3'>Tidak Aktif</td>
                                    @endif
                                    <td class="text-center">
                                        <a href="{{ url('/transaction/detail/' . $data->id) }}"
                                            class="btn btn-success">Detail</a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
        </div>
    </div>

@endsection

@section('script')
@endsection

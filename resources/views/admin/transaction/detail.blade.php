@extends('layouts.panel')

@section('title', 'Detail Transaksi')

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
                                <th>Amount</th>
                                <th>Saving Id</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 0; ?>
                            @foreach ($datas as $key => $data)
                                <tr>
                                    <td class="text-center w-1">{{ ++$no }}</td>
                                    <td>{{ $data->amount }}</td>
                                    <td>{{ $data->saving_id }}</td>
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
    <script>
    </script>
@endsection

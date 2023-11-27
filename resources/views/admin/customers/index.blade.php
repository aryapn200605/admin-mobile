@extends('layouts.panel')

@section('title', 'Customers')

@section('header-item')
    <a href="{{ url('/customers/registration') }}" class="btn btn-primary float-right mb-3">Daftar Mobile Customer</a>
@endsection

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
                                <th>CIF</th>
                                <th>Nama Nasabah</th>
                                <th>Username</th>
                                <th>Tanggal Dibuat</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 0; ?>
                            @foreach ($datas as $key => $data)
                                <tr>
                                    <td class="text-center w-1">{{ ++$no }}</td>
                                    <td>{{ $data->customer_id }}</td>
                                    <td>{{ $data->first_name }}</td>
                                    <td>{{ $data->username }}</td>
                                    <td>{{ $data->created_at }}</td>
                                    <td class="text-center">
                                        @if ($data->attempts < 3)
                                            -
                                        @else
                                            <button class="btn btn-warning unblock-btn"
                                                data-user-id="{{ $data->id }}">Unblock</button>
                                        @endif
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
    <script>
        $(document).ready(function() {
            $('.unblock-btn').click(function() {
                var userId = $(this).data('user-id');

                Swal.fire({
                    title: 'Anda yakin?',
                    text: 'Anda akan membuka blokir pengguna ini.',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Ya, buka blokir!',
                    cancelButtonText: 'Tidak, batalkan!',
                }).then((result) => {
                    if (result.isConfirmed) {
                        let url = `{{ url('customers/unblock-customer/') }}/${userId}`;
                        $.ajax({
                            type: 'GET',
                            url: url,
                            success: function(response) {
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Berhasil!',
                                    text: response.message,
                                }).then(() => {
                                    window.location.reload();
                                });

                            },
                            error: function(error) {
                                console.error('Error:', error);

                                Swal.fire({
                                    icon: 'error',
                                    title: 'Oops...',
                                    text: 'Terjadi kesalahan!',
                                });
                            }
                        });
                    }
                });
            });
        });
    </script>
@endsection

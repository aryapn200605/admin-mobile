@extends('layouts.panel')

@section('title', 'Pengajuan Top Up Pinjaman')

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
                                <th>Nama Nasabah</th>
                                <th>CIF</th>
                                <th>Jumlah Pengajuan</th>
                                <th>Alasan</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $no = 0; ?>
                            @foreach ($datas as $key => $data)
                                <tr>
                                    <td class="text-center w-1">{{ ++$no }}</td>
                                    <td>{{ $data->first_name }}</td>
                                    <td>{{ $data->customer_id }}</td>
                                    <td>{{$data->amount}}</td>{{-- {{ 'Rp' . number_format($data->amount, 0, ',', '.') }} --}}
                                    <td>{{ $data->reason }}</td>
                                    <td class="text-center text-bold @if ($data->status == 0) text-warning @elseif ($data->status == 2) text-danger @else text-success @endif">
                                        @if ($data->status == 0)
                                            <div class="row">
                                                <div class="col-6">
                                                    <button id="{{ $data->id }}"
                                                        class="btn btn-danger choose-btn reject">Tolak</button>
                                                </div>
                                                <div class="col-6">
                                                    <button id="{{ $data->id }}"
                                                        class="btn btn-success choose-btn accept">Terima</button>
                                                </div>
                                            </div>
                                        @else
                                            @if ($data->status == 0)
                                                Menunggu Konfirmasi!
                                            @elseif ($data->status == 2)
                                                Ditolak!
                                            @else
                                                Diterima!
                                            @endif
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
        $(".accept").on("click", function() {
            var buttonId = $(this).attr("id");

            Swal.fire({
                title: 'Apakah Anda yakin?',
                text: 'Apakah Anda benar-benar ingin menerima pengajuan ini?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Terima'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        method: 'GET',
                        url: '/loan-topup/accept',
                        data: {
                            id: buttonId
                        },
                        success: function(response) {
                            location.reload();
                        },
                        error: function(error) {
                            console.log(error);
                        }
                    });
                }
            });
        });

        $(".reject").on("click", function() {
            var buttonId = $(this).attr("id");

            Swal.fire({
                title: 'Berikan alasan untuk penolakan',
                input: 'text',
                showCancelButton: true,
                confirmButtonText: 'Reject',
                cancelButtonText: 'Cancel',
                showLoaderOnConfirm: true,
                preConfirm: (reason) => {
                    return $.ajax({
                        method: 'GET',
                        url: '/loan-topup/reject',
                        data: {
                            reason: reason,
                            id: buttonId
                        },
                        success: function(response) {
                            location.reload();
                        },
                        error: function(error) {
                            console.log(error);
                            Swal.showValidationMessage('An error occurred');
                        }
                    });
                },
                allowOutsideClick: () => !Swal.isLoading()
            });
        });
    </script>
@endsection